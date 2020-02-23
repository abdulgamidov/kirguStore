//
//  AchieveCell.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import SDWebImage
import PinLayout

class AchieveCell: UICollectionViewCell {
  
  static let reuseIdentifier = "AchieveCell"
  
  private let achieveImage: UIImageView = {
    var image = UIImageView(frame: CGRect(x: 141, y: 110, width: 110, height: 110))
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    return image
  }()
  
  private let achieveName: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let achieveDescription: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let achieveProgress: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let achievePoint: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    contentView.addSubview(achieveImage)
    contentView.addSubview(achievePoint)
    contentView.addSubview(achieveProgress)
    contentView.addSubview(achieveDescription)
    contentView.addSubview(achieveName)
    
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 8
    contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(achieve: Achieve) {
    achieveImage.sd_setImage(with: URL(string: achieve.image), completed: nil)
    achieveName.text = achieve.name
    achieveDescription.text = achieve.desc
    achieveProgress.text = achieve.progress
    achievePoint.text = "\(achieve.point) kp"
    
    setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  func layout() {
    achieveImage.pin.top(pin.safeArea).left(pin.safeArea).size(55).aspectRatio().marginTop(10).marginLeft(15)
        
      achieveName.pin.after(of: achieveImage, aligned: .top).marginLeft(15).sizeToFit()
      
      achieveDescription.pin.below(of: achieveName, aligned: .left).right(15).marginTop(5).sizeToFit(.width)
      
      achieveProgress.pin.below(of: achieveDescription, aligned: .left).marginTop(5).sizeToFit()
      
      achievePoint.pin.after(of: achieveProgress, aligned: .center).marginLeft(6).right().sizeToFit(.width)

  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    layout()
    return contentView.frame.size
  }
  
}
