//
//  FortunaAlert.swift
//  kirguStore
//
//  Created by Rizabek on 23.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import PinLayout

import UIKit


class FortunaAlert: UIView {

  private let alertLabel: UILabel = {
    let label = UILabel(frame: CGRect(x: 46, y: 55, width: 200, height: 20))
    label.numberOfLines = 0
    label.text = "Хотите покрутить барабан"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 20)
    label.textAlignment = .center
    
    return label
  }()
  
  private let alertImage: UIImageView = {
    var image = UIImageView(image: UIImage(named: "yakubovich"))
    image.frame = CGRect(x: 210, y: 90, width: 90, height: 90)
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    
    return image
  }()
  
  private let okButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 90, y: 155, width: 100, height: 50))
    button.setImage(UIImage(named: "ok"), for: .normal)
    button.addTarget(self, action: #selector(okAction(sender:)), for: .touchUpInside)
       
    return button
  }()
  
  private let cancelButton: UIButton = {
    let button = UIButton(frame: CGRect(x: 290, y: 12, width: 71, height: 21))
    button.setImage(UIImage(named: "cancel"), for: .normal)
    button.addTarget(self, action: #selector(cancelAction(sender:)), for: .touchUpInside)
       
    return button
  }()
  
  init() {
    super.init(frame: CGRect(x: 35, y: 260, width: 350, height: 200))
      backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
      
      addSubview(alertLabel)
      addSubview(alertImage)
      addSubview(cancelButton)
      addSubview(okButton)
      
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
    let vc = 
  }
  
  @objc
  func cancelAction (sender: UIButton) {
    
  }
}
