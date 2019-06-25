//
//  ViewController.swift
//  PhraseGenerator
//
//  Created by Tyler Hutcherson on 6/21/19.
//  Copyright © 2019 Skafos, LLC. All rights reserved.
//

import UIKit
import Skafos
import CoreML
import Foundation

class ViewController: UIViewController {
  
  // MARK: Properties
  @IBOutlet weak var submitButton: UIButton!
  @IBOutlet weak var inputField: UITextField!
  @IBOutlet weak var generatedPhrase: UILabel!
  @IBOutlet weak var reloadModelButton: UIButton!
  @IBOutlet weak var phraseLenStepper: UIStepper!
  @IBOutlet weak var phraseLenValue: UILabel!
  
  // Some Constants
  private let skafosModelName:String = "PhraseGenModel"
  private let docsDir = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!)
  
  // Initial Model Instantiation
  private var phraseGenModel:PhraseGenModel = PhraseGenModel()
  
  // Load the tokenizer (word index) and init the bag of words
  private lazy var wordIndex = loadWordIndex().sorted(by: <)
  private lazy var bagOfWords:BagOfWords! = BagOfWords(words: wordIndex.map { "\($1)" })
  private lazy var lemmatizer = Lemmatizer()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Download model and tokenizer (word index) from Skafos
    self.loadModel()
  }
  
  
  // MARK: Private Helpers
  @objc
  func loadModel(_ sender:Any? = nil) {
    console.info("Checking for Model from Skafos...")
    Skafos.load(asset: self.skafosModelName) { (error, asset) in
      // Log the asset in the console
      console.info(asset)
      guard error == nil else {
        console.error("Skafos load error: \(String(describing: error))")
        return
      }
      // Assign the new model to the CoreML class
      if let model = asset.model {
        self.phraseGenModel.model = model
      }
      // Update the word index and re-init the bag of words model
      self.wordIndex = self.loadNewWordIndex(asset).sorted(by: <)
      print("Finished loading the updated word index")
      self.bagOfWords =  BagOfWords(words: self.wordIndex.map { "\($1)" })
    }
  }
  
  func loadNewWordIndex(_ asset: Asset) -> [Int : String] {
    // Pull out the required files from the asset
    guard let wordIndexFile = asset.files.filter({$0.name == "index_word_lookup.json"}).first else {
      fatalError("I need these two things")
    }
    // Extract the right file path and load the JSON data
    var newWordIndex = [Int : String]()
    let wordIndexFilePath = splitPath(path: wordIndexFile.path)
    let wordIndexFileURL = docsDir.appendingPathComponent(wordIndexFilePath)
    let wordIndexData = try! Data(contentsOf: wordIndexFileURL)
    let json = try! JSONSerialization.jsonObject(with: wordIndexData, options: [])
    if let object = json as? [String: String] {
      _ = object.map { row in
        newWordIndex[Int(row.0)!] = row.1
      }
    }
    // return the new Word Index
    return newWordIndex
  }
  
  func splitPath(path: String) -> String {
    return path.components(separatedBy: "Documents/").last ?? ""
  }
  
  private func generatePhrase(initialWords: String, length: Int) -> String {
    var phrase = initialWords.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
    var currentWord = initialWords.components(separatedBy: " ").last
    
    // Loop through and generate a phrase from the model
    for _ in 1...length {
      let nextWords = predictNext(words: phrase, predictionCount: 4)
      for nextWord in nextWords {
        if currentWord != nextWord {
          phrase = phrase + " " + nextWord
          currentWord = nextWord
          break
        }
      }
    }
    return phrase
  }
  
  private func loadWordIndex() -> [Int: String] {
    var result = [Int : String]()
    if let file = Bundle.main.url(forResource: "index_word_lookup", withExtension: "json") {
      let data = try! Data(contentsOf: file)
      let json = try! JSONSerialization.jsonObject(with: data, options: [])
      if let object = json as? [String: String] {
        _ = object.map { row in
          result[Int(row.0)!] = row.1
        }
        return result
      }
    }
    return result
  }
  
  private func predictNext(words: String, predictionCount: Int) -> [String] {
    print("RUNNING PREDICTION ON TEXT: " + words)
    let lemmas = lemmatizer.lemmatize(text: words).compactMap { $0.1 }
    print(lemmas)
    // Don't run with scissors
    if lemmas.count == 0 {
      return []
    }
    
    let embedding = bagOfWords.embed(words: lemmas)
    
    let size = NSNumber(value: embedding.count)
    let mlMultiArrayInput = try! MLMultiArray(shape:[size, 1, 1], dataType:MLMultiArrayDataType.double)
    
    for i in 0..<size.intValue {
      mlMultiArrayInput[i] = NSNumber(floatLiteral: Double(embedding[i]))
    }
    
    let modelInput = PhraseGenModelInput(tokenizedInputSeq: mlMultiArrayInput)
    
    guard let modelOutput = try? phraseGenModel.model.prediction(from: modelInput) else {
      print("Prediction failed!")
      return []
    }
    
    guard let wordProbability = modelOutput.featureValue(for: "tokenProbs")?.multiArrayValue else {
      print("Prediction failed!")
      return []
    }
    
    // Super sketchy conversion - I'm pretty sure I'm doing way more work than I need to
    let mm = wordProbability
    let length = mm.count
    let doublePtr =  mm.dataPointer.bindMemory(to: Double.self, capacity: length)
    let doubleBuffer = UnsafeBufferPointer(start: doublePtr, count: length)
    let output = Array(doubleBuffer)
    
    var outputDict = [Int: Double]()
    for (index, probability) in output.enumerated() {
      outputDict[index] = probability
    }
    
    let sortedByProbabilityDictionary = outputDict.sorted { $0.1 > $1.1 }
    var sortedSmallOutput = [Int]()
    sortedByProbabilityDictionary.prefix(predictionCount).forEach {
      sortedSmallOutput.append($0.key)
    }
    
    // Get top X predictions
    return self.bagOfWords.reverseEmbed(wordInts: sortedSmallOutput)
  }
  
  
  // MARK: Actions
  @IBAction func submitText(_ sender: Any) {
    if inputField.text! == "" {
      // Reset to default state
      generatedPhrase.text = "Need some seed text!"
    } else {
      // get a phrase prediction
      let newPhrase = generatePhrase(initialWords: inputField.text!, length: Int(phraseLenValue.text!)!)
      print("New Phrase from Model: \(newPhrase)")
      // Set label
      if (newPhrase.components(separatedBy: " ").count > 0) {
        generatedPhrase.text = newPhrase
      } else {
        generatedPhrase.text = "No suggestions available!"
      }
    }
  }
  
  @IBAction func tryReloadingModel(_ sender: UIButton) {
    self.loadModel()
  }
  
  @IBAction func stepperChanged(_ sender: UIStepper) {
    phraseLenValue.text = Int(sender.value).description
  }
  
  

}
