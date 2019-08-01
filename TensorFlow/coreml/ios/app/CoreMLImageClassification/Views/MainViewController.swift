//
//  MainViewController.swift
//  CoreMLImageClassification
//
//  Created by Skafos.ai on 07/31/19.
//  Copyright © 2019 Skafos, LLC. All rights reserved.
//

import Foundation
import UIKit
import Skafos
import CoreML
import Vision
import SnapKit

class MainViewController : ViewController {
  // This will be the model name you also use on the Skafos dashboard
  private let modelName:String = "ImageClassifier"
  private let imageClassifier:ImageClassifier! = ImageClassifier()
  private let docsDir = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!)
  private var currentImage:UIImage! = nil

  private lazy var labels: [String]? = {
    guard let initialLabelsURL: URL = Bundle.main.url(forResource: "output_labels", withExtension: "txt") else {
      debugPrint("Could not load initial labels")
      return nil
    }
    return self.loadLabels(labelsURL: initialLabelsURL)
  }()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.photoButton.addTarget(self, action: #selector(photoAction(_:)), for: .touchUpInside)
    self.cameraButton.addTarget(self, action: #selector(cameraAction(_:)), for: .touchUpInside)
    self.reloadButton.addTarget(self, action: #selector(loadModel(_:)), for: .touchUpInside)
    self.loadModel()
  }
  
  @objc
  func loadModel(_ sender:Any? = nil) {
    console.info("Loading Model...")
    Skafos.load(asset: self.modelName) { (error, asset) in
      // Log the asset in the console
      console.info(asset)
      guard error == nil else {
        console.error("Skafos load error: \(String(describing: error))")
        return
      }
      
      if let model = asset.model {
        // Assign the updated model
        self.imageClassifier.model = model
      }
      // Grab new labels from the asset and reinit them
      self.unpackLabels(asset)
    }
  }
  
  func unpackLabels(_ asset: Asset) {
    // Pull out the required file from the asset
    guard let labelsFile = asset.files.filter({$0.name == "output_labels.txt"}).first else {
      fatalError("I need the labels file.. it's not in the asset")
    }
    // Extract the right path to the file
    let labelsFullPath = splitPath(path: labelsFile.path)
    let labelsURL = docsDir.appendingPathComponent(labelsFullPath)
    // Re-initialize the labels from file
    self.labels = self.loadLabels(labelsURL: labelsURL)
  }
  
  func splitPath(path: String) -> String {
    return path.components(separatedBy: "Documents/").last ?? ""
  }
  
  /// Loads the labels from the labels file and stores them in the `labels` property.
  func loadLabels(labelsURL: URL) -> [String] {
    do {
      let contents = try String(contentsOf: labelsURL, encoding: .utf8)
      let l = contents.components(separatedBy: .newlines)
      return l
    } catch let error {
      print("ERROR: \(error)")
      fatalError("Labels file cannot be read. Please add a valid labels file and try again.")
    }
  }
  
  @objc
  func cameraAction(_ sender:Any? = nil) {
    let myPickerController = UIImagePickerController()
    myPickerController.delegate = self;
    myPickerController.sourceType = .camera
    self.present(myPickerController, animated: true, completion: nil)
  }
  
  @objc
  func photoAction(_ sender:Any? = nil) {
    let myPickerController = UIImagePickerController()
    myPickerController.delegate = self;
    myPickerController.sourceType = .photoLibrary
    self.present(myPickerController, animated: true, completion: nil)
  }
  
  func classifyImage(image:UIImage) {
    self.currentImage = image
    let orientation   = CGImagePropertyOrientation(rawValue: UInt32(image.imageOrientation.rawValue))!
    guard let ciImage = CIImage(image: image) else { fatalError("Bad image") }
    let model = try! VNCoreMLModel(for: self.imageClassifier.model)
    
    let request = VNCoreMLRequest(model: model) {[weak self] request, error in
      self?.processClassifications(for: request, error: error)
    }
    request.imageCropAndScaleOption = .centerCrop
    
    DispatchQueue.global(qos: .userInitiated).async {
      let handler = VNImageRequestHandler(ciImage: ciImage, orientation: orientation)
      
      do {
        try handler.perform([request])
      } catch {
        print("Failed: \n\(error.localizedDescription)")
      }
    }
  }
  
  func showClassification(message:String) {
    let alertController = UIAlertController(title: "Classification", message: message, preferredStyle: .alert)
    let previewImage = self.currentImage.imageWithSize(scaledToSize: CGSize(width: 150, height: 150))
    let customView = UIImageView(image: previewImage)
    alertController.view.addSubview(customView)
    
    customView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(100)
      make.centerX.equalToSuperview()
      make.height.equalTo(previewImage.size.height)
    }
    
    alertController.view.snp.makeConstraints { (make) in
      make.height.equalTo(customView.frame.height+190)
    }
    
    let action = UIAlertAction(title: "OK", style: .default) { (actionitem) in
      if let imagePicker = (self.presentedViewController as? UIImagePickerController) {
        if (imagePicker.sourceType == .camera) {
          self.dismiss(animated: false, completion: nil)
        }
      }
    }
    
    alertController.addAction(action)
    
    // Save to Photo Library
    if let imagePicker = (self.presentedViewController as? UIImagePickerController) {
      if (imagePicker.sourceType == .camera) {
        let saveAction = UIAlertAction(title: "Save Image", style: .default) { (actionitem) in
          UIImageWriteToSavedPhotosAlbum(self.currentImage, nil, nil, nil)
          self.dismiss(animated: false, completion: nil)
        }
        alertController.addAction(saveAction)
      }
    }
    
    self.presentedViewController?.present(alertController, animated: true, completion: nil)
  }
  
  func processClassifications(for request: VNRequest, error: Error?) {
    DispatchQueue.main.async {
      guard let results = request.results else {
        print("Unable to classify image.\n\(error!.localizedDescription)")
        return
      }
      
      var final_layer = results as! [VNCoreMLFeatureValueObservation]
      
      if final_layer.isEmpty {
        print("No Classifications")
      } else {
        // Display top classifications ranked by confidence in the UI.
        let probArray: Array<(String, Double)> = {
          let outputFeatures = final_layer[0].featureValue.multiArrayValue
          let outputFeaturesArray = self.mlArrayToArray(input: outputFeatures!)
          let sortedOutput = self.createOutput(results: outputFeaturesArray)
          print(sortedOutput)
          return sortedOutput
        }()
        
        let descriptions = probArray.map { cls in
          return String(format: "  (%.3f) %@", cls.1, cls.0)
        }
        let message = descriptions.joined(separator: "\n")
        self.showClassification(message: message)
      }
    }
  }
  
  func mlArrayToArray(input: MLMultiArray) -> Array<Double> {
    let length = input.count
    let doublePtr =  input.dataPointer.bindMemory(to: Double.self, capacity: length)
    let doubleBuffer = UnsafeBufferPointer(start: doublePtr, count: length)
    let output = Array(doubleBuffer)
    return output
  }
  
  /// Returns the top N inference results sorted in descending order.
  func createOutput(results: [Double]) -> Array<(String,Double)> {
    let zippedResults = zip(Array(labels!), results)
      // Sort the zipped results by confidence value in descending order.
      let sortedResults = zippedResults.sorted { $0.1 > $1.1 }
      // Return the `Inference` results.
      return sortedResults
  }
}


extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
      self.classifyImage(image: image)
    }else{
      print("Something went wrong")
      self.dismiss(animated: true, completion: nil)
    }
  }
}
