//
//  ViewController.swift
//  CoreMLImageClassification
//
//  Created by Skafos.ai on 07/31/19.
//  Copyright © 2019 Skafos, LLC. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
  
  lazy var label:UILabel = {
    let label           = UILabel()
    label.text          = "Image Classification"
    label.font          = label.font.withSize(40)
    label.textAlignment = .center
    
    self.view.addSubview(label)
    
    return label
  }()
  
  lazy var about:UILabel = {
    let label           = UILabel()
    label.text          = "Allows you to select an image as input to the Image Classifier model. Based on what images the model was trained on, it will predict the probability of your input image being one of the available classifications."
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 5
    
    self.view.addSubview(label)
    
    return label
  }()
  
  lazy var reloadButton:UIButton = {
    let button        = UIButton(type: .system)
    button.backgroundColor = .white
    
    button.setTitle("Reload Model", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.textAlignment = .center
    
    button.tintColor = UIColor.blue
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.black.cgColor
    
    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
    
    self.view.addSubview(button)
    return button
  }()
  
  lazy var photoButton:UIButton = {
    let button        = UIButton(type: .custom)
    button.backgroundColor = .white
    
    button.setTitle("Choose from your photo library", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.textAlignment = .left
    button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
    if let image = UIImage(named: "imageGalleryIcon.png")?.imageWithSize(scaledToSize: CGSize(width: 100, height: 100)).withRenderingMode(.alwaysTemplate) {
      button.setImage(image, for: .normal)
    }
    button.imageView?.tintColor = .black
    button.tintColor = UIColor.blue
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.black.cgColor
    
    
    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
    
    self.view.addSubview(button)
    return button
  }()
  
  lazy var cameraButton:UIButton = {
    let button        = UIButton(type: .custom)
    button.backgroundColor = .white
    
    button.setTitle("Use your camera", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.setTitleColor(.gray, for: .highlighted)
    button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
    button.titleLabel?.textAlignment = .left
    if let image = UIImage(named: "cameraIcon.png")?.imageWithSize(scaledToSize: CGSize(width: 100, height: 100)).withRenderingMode(.alwaysTemplate) {
      button.setImage(image, for: .normal)
    }
    
    button.contentHorizontalAlignment = .left
    button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 0.0)
    
    button.imageView?.tintColor = .black
    button.tintColor = UIColor.blue
    button.layer.borderWidth = 2.0
    button.layer.borderColor = UIColor.black.cgColor
    
    self.view.addSubview(button)
    
    return button
  }()
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    label.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(60)
      make.right.left.equalToSuperview()
      make.height.equalTo(60)
    }
    about.snp.makeConstraints { (make) in
      make.top.equalTo(label.snp.bottom).offset(10)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(120)
    }
    
    reloadButton.snp.makeConstraints { (make) in
      make.top.equalTo(about.snp.bottom).offset(50)
      make.left.equalToSuperview().inset(10)
      make.width.greaterThanOrEqualTo(130)
      make.height.equalTo(50)
    }
    
    photoButton.snp.makeConstraints { (make) in
      make.top.equalTo(reloadButton.snp.bottom).offset(50)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(100)
    }
    
    cameraButton.snp.makeConstraints { (make) in
      make.top.equalTo(photoButton.snp.bottom).offset(10)
      make.right.left.equalToSuperview().inset(10)
      make.height.equalTo(100)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
  }
}
