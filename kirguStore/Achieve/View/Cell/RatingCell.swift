//
//  RatingCell.swift
//  kirguStore
//
//  Created by Rizabek on 23.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//


import UIKit
import SDWebImage
import PinLayout

class RatingCell: UICollectionViewCell {
  
  static let reuseIdentifier = "RatingCell"
  
  private let ratingImage: UIImageView = {
    var image = UIImageView(frame: CGRect(x: 141, y: 110, width: 110, height: 110))
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    return image
  }()
  
  private let ratingName: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let ratingLevel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let ratingPoint: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  private let ratingSpot: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)

    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    contentView.addSubview(ratingImage)
    contentView.addSubview(ratingSpot)
    contentView.addSubview(ratingPoint)
    contentView.addSubview(ratingLevel)
    contentView.addSubview(ratingName)
    
    contentView.clipsToBounds = true
    contentView.layer.cornerRadius = 8
    contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(rating: Rating) {
    ratingImage.sd_setImage(with: URL(string: rating.image), completed: nil)
    ratingName.text = rating.name
    ratingLevel.text = "\(rating.level) уровень"
    ratingPoint.text = "\(rating.point) kp"
    ratingSpot.text = "\(rating.rating) mesto"

    setNeedsLayout()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }

  func layout() {
    ratingImage.pin.top(pin.safeArea).left(pin.safeArea).bottom(pin.safeArea).size(120).aspectRatio()
        
        ratingName.pin.after(of: ratingImage, aligned: .top).marginLeft(20).sizeToFit().marginTop(20)
      
        ratingLevel.pin.below(of: ratingName, aligned: .left).right(15).marginTop(5).sizeToFit(.width)
    

        ratingPoint.pin.below(of: ratingLevel, aligned: .left).marginTop(24).sizeToFit()
      
    ratingSpot.pin.after(of: ratingName).top(pin.safeArea).right(pin.safeArea).marginRight(18).marginTop(18).sizeToFit()
    ratingSpot.pin.top(pin.safeArea).right(pin.safeArea).marginRight(18).marginTop(18).sizeToFit(.width)
//      ratingSpot.pin.after(of: ratingPoint, aligned: .center).marginLeft(6).right().sizeToFit(.width)

  }
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    layout()
    return contentView.frame.size
  }
  
}
