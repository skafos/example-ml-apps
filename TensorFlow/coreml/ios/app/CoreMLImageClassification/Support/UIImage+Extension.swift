//
//  UIImage+Extension.swift
//  CoreMLImageClassification
//
//  Created by Skafos.ai on 07/31/19.
//  Copyright © 2019 Skafos, LLC. All rights reserved.
//

import UIKit
import VideoToolbox


extension UIImage {
  
  func imageWithSize(scaledToSize newSize: CGSize) -> UIImage {
    let horizontalRatio = newSize.width / self.size.width
    let verticalRatio = newSize.height / self.size.height
    
    let ratio = max(horizontalRatio, verticalRatio)
    let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio)
    
    UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
    self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
    let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return newImage
  }
}
