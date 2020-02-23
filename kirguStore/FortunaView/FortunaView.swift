//
//  FortunaView.swift
//  kirguStore
//
//  Created by Rizabek on 23.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import PinLayout

import UIKit


class FortunaView: UIView {

  private let fortunaLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 24, y: 21, width: 327, height: 51))
    label.numberOfLines = 0
    label.text = "Вам выпало:"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 36)
    label.textAlignment = .center
    
    return label
  }()
  
  private let fortunaImage: UIImageView = {
    var image = UIImageView(image: UIImage(named: "fortuna"))
    image.frame = CGRect(x: 210, y: 90, width: 228, height: 228)
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    
    return image
  }()
  
  private let fortunaNarrowImage: UIImageView = {
    var image = UIImageView(image: UIImage(named: "fortunanarrow"))
    image.frame = CGRect(x: 56, y: 270, width: 57, height: 40)
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    
    return image
  }()
  
  private let runButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 209, y: 529, width: 100, height: 50))
    button.setImage(UIImage(named: "runBtn"), for: .normal)
    button.addTarget(self, action: #selector(okAction(sender:)), for: .touchUpInside)
       
    return button
  }()
  
  private let cancelButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 25, y: 529, width: 142, height: 31))
    button.setImage(UIImage(named: "cancelBtn"), for: .normal)
    button.addTarget(self, action: #selector(cancelAction(sender:)), for: .touchUpInside)
       
    return button
  }()
  
  init() {
    super.init(frame:.zero)
      backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      
      addSubview(cancelButton)
      addSubview(runButton)
      addSubview(fortunaImage)
      addSubview(fortunaNarrowImage)
      addSubview(fortunaLabel)
      
  }
  
  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
      super.layoutSubviews()
      
  }
  
  func layout () {
    
////    cancelButton.pin.top(pin.safeArea).right(pin.safeArea).size(24).aspectRatio().marginTop(12).marginRight(12)
//
//        alertLabel.pin.hCenter().vCenter().sizeToFit(.width)
//
////        okButton.pin.below(of: alertLabel, aligned: .center).width(71).height(21).aspectRatio().sizeToFit(.width)
////
////        alertImage.pin.after(of: alertLabel)
  }
  
  
  @objc
  func okAction (sender: UIButton) {
    
  }
  
  @objc
  func cancelAction (sender: UIButton) {
    
  }
}
