//
//  BagOfWords.swift
//  PhraseGenerator
//
//  Created by Tyler Hutcherson on 6/21/19.
//  Copyright © 2019 Skafos, LLC. All rights reserved.
// https://medium.com/@JMangia/coreml-nlc-with-keras-tensorflow-and-apple-nslinguistictagger-cd971cda64c9

import Foundation

struct BagOfWords: Codable {
  let arrayofWords: [String]
  
  init(words: [String]) {
    self.arrayofWords = words
  }
  
  func embed(words: [String]) -> [Int] {
    var embedding = [Int](repeating: 0, count: words.count)
    
    for (wordIndex, word) in words.enumerated() {
      for (index, _) in arrayofWords.enumerated() {
        if arrayofWords[index] == word {
          embedding[wordIndex] = index + 1
          break
        }
      }
    }
    
    return embedding
  }
  
  func reverseEmbed(wordInts: [Int]) -> [String] {
    var words = [String]()
    
    for wordInt in wordInts {
      words.append(arrayofWords[wordInt])
    }
    
    return words
  }
}
