//
//  CatalogView.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import PinLayout

protocol CatalogViewProtocol {
  func showCatalog(catalog: [Catalog])
}

protocol DidSelectRowDelegate: AnyObject {
  func didSelectRow(indexPath: IndexPath)
}

class CatalogView: UIView, CatalogViewProtocol {
  
  private var collectionView: UICollectionView!
  private let fromLayout = UICollectionViewFlowLayout()
  
  weak var didSelectRowDelegate: DidSelectRowDelegate?
  
  private let catalogCell = CatalogCell()
  private var presenter: CatalogPresenterProtocol!
  var catalogs: [Catalog] = []
  private let spacing: CGFloat = 16
  
  
  init() {
    super.init(frame: .zero)
    
    presenter = CatalogPresenter(view: self)
    presenter.getCatalog()
    backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    
    if #available(iOS 11, *) {
      fromLayout.sectionInsetReference = .fromSafeArea
    }
    
    collectionView = UICollectionView(frame: .zero, collectionViewLayout: fromLayout)
    fromLayout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    fromLayout.minimumLineSpacing = spacing
    fromLayout.minimumInteritemSpacing = spacing
    
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    collectionView.register(CatalogCell.self, forCellWithReuseIdentifier: CatalogCell.reuseIdentifier)
    
    addSubview(collectionView)
  }
  
  required init?(coder aCoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func viewOrientationDidChange() {
    fromLayout.invalidateLayout()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.pin.all(pin.safeArea)

  }
  
  func showCatalog(catalog: [Catalog]) {
    self.catalogs = catalog
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  

}


extension CatalogView: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let numberOfItemsPerRow: CGFloat = 2
    let scacingBetweenCells: CGFloat = spacing
    
    let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * scacingBetweenCells)
    
    if let collection = self.collectionView {
       let width = (collection.bounds.width - totalSpacing) / numberOfItemsPerRow
      
      return CGSize(width: width, height: width + 47)
    }
    return CGSize(width: 0, height: 0)
  }
}

extension CatalogView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return catalogs.count 
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseIdentifier, for: indexPath) as! CatalogCell
    cell.configure(catalog: catalogs[indexPath.row])
    cell.layer.cornerRadius = 8
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    didSelectRowDelegate?.didSelectRow(indexPath: indexPath)
  }
  
}
