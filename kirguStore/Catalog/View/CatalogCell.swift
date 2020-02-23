//
//  CatalogCell.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import SDWebImage
import PinLayout


class CatalogCell: UICollectionViewCell {
  
  static let reuseIdentifier = "CatalogCell"
  
    private let catalogImage = UIImageView()
 
    private let catalogAddressLabel: UILabel = {
      let label = UILabel()
      label.text = ""
      label.numberOfLines = 1
      label.font = UIFont(name: "Roboto-Regular", size: 12)
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      return label
    }()
  
    private let catalogNameLabel: UILabel = {
      let label = UILabel()
      label.text = ""
      label.numberOfLines = 1
      label.font = UIFont(name: "Roboto-Regular", size: 16)
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      return label
    }()
  
    private let catalorPriceLabel: UILabel = {
      let label = UILabel()
      label.text = ""
      label.numberOfLines = 1
      label.font = UIFont(name: "Roboto-Regular", size: 10)
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      return label
    }()
  
    private let catalogType: UILabel = {
        let label = UILabel()
        label.text = "Места туристические"
        label.numberOfLines = 1
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.textColor = #colorLiteral(red: 0.4588235294, green: 0.4588235294, blue: 0.4588235294, alpha: 1)
        return label
    }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubview(catalogNameLabel)
    
    catalogImage.contentMode = .scaleAspectFill
    catalogImage.clipsToBounds = true
    contentView.addSubview(catalogImage)
    contentView.addSubview(catalogAddressLabel)
    contentView.addSubview(catalorPriceLabel)
    contentView.addSubview(catalogType)
    contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    contentView.layer.cornerRadius = 8
    contentView.clipsToBounds = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
  }
  
  func configure(catalog: Catalog) {
    catalogImage.sd_setImage(with: URL(string: catalog.image), completed: nil)
    catalogNameLabel.text = catalog.name
    catalogType.text = catalog.type
    catalorPriceLabel.text = catalog.price
    
    setNeedsLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
  }
  
  private func layout () {
    catalogImage.pin.top().width(100%).aspectRatio().height(120)
    
    catalogType.pin.below(of: catalogImage, aligned: .left).marginTop(8).marginLeft(8).marginRight(8).right().sizeToFit(.width)
    
    catalogNameLabel.pin.below(of: catalogType, aligned: .left).marginTop(8).width(70%).sizeToFit(.width)

    catalorPriceLabel.pin.below(of: catalogNameLabel, aligned: .left).marginTop(8).width(70%).sizeToFit(.width)
    
  }
  
 
  
  override func sizeThatFits(_ size: CGSize) -> CGSize {
    contentView.pin.width(size.width)
    layout()
    return contentView.frame.size
  }
}
