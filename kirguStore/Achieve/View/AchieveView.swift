//
//  AchieveView.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit
import PinLayout


protocol AchiewViewProtocol {
  func showAchieveList(achieve: [Achieve])
  func showRatingList(rating: [Rating])
}

class AchieveView: UIView, AchiewViewProtocol {
  
  var achievments: [Achieve] = []
  var ratings: [Rating] = []
  private var presenter: AchievePresenterProtocol!
  
  private let contentView = UIView()
  private let segmented = UISegmentedControl(items: ["Достижения", "Рейтинг"])
  
  private let userView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 412, height: 220))
    view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
    view.clipsToBounds = true
    view.contentMode = .scaleToFill
    return view
  }()
  
  private let userPhoto: UIImageView = {
    var image = UIImageView(image: UIImage(named: "madina"))
    image.frame = CGRect(x: 141, y: 110, width: 110, height: 110)
    image.clipsToBounds = true
    image.contentMode = .scaleToFill
    
    return image
  }()
  
  private let username: UILabel = {
    let label = UILabel(frame: CGRect(x: 158, y: 225, width: 76, height: 22))
    label.text = "Мадина"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 22)
    label.textAlignment = .center
    
    return label
  }()
  
  private let userLevel: UILabel = {
    let label = UILabel(frame: CGRect(x: 127, y: 245, width: 150, height: 20))
    label.text = "1 уровень  200 kp"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.font = UIFont(name: "Roboto-Regular", size: 20)
    label.textAlignment = .center
    
    return label
  }()
  
  let collectionView: UICollectionView = {
    let spacing: CGFloat = 16
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    layout.minimumLineSpacing = spacing
    layout.minimumInteritemSpacing = spacing
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(AchieveCell.self, forCellWithReuseIdentifier: AchieveCell.reuseIdentifier)
    collectionView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
    
    return collectionView
  }()
  
  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    
    presenter = AchievePresenter(view: self)
    presenter.getAchieveList()
    presenter.getRatingList()
    
    collectionView.delegate = self
    collectionView.dataSource = self
    addSubview(collectionView)
    
    userView.addSubview(userPhoto)
    userView.addSubview(username)
    userView.addSubview(userLevel)
    addSubview(userView)
    
    segmented.backgroundColor = .clear
    segmented.selectedSegmentIndex = 0
    segmented.selectedSegmentTintColor = #colorLiteral(red: 0.8588235294, green: 0.1882352941, blue: 0.1333333333, alpha: 1)
    segmented.addTarget(self, action: #selector(switchControll(sender: )), for: .valueChanged)
    addSubview(segmented)
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layout()
    collectionView.reloadData()
  }
  
  private func layout() {
    
    userView.pin.top().width(100%).aspectRatio().height(300)
    
    segmented.pin.below(of: userView).top().width(100%)
    
    collectionView.pin.below(of: segmented).hCenter().top().width(100%).height(100%).aspectRatio()
    
  }
  
  func showAchieveList(achieve: [Achieve]) {
    self.achievments = achieve
    
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  func showRatingList(rating: [Rating]) {
    self.ratings = rating
    
    DispatchQueue.main.async {
      self.collectionView.reloadData()
    }
  }
  
  @objc
  func switchControll (sender: UISegmentedControl) {
    
    
    if segmented.selectedSegmentIndex == 1 {
      collectionView.register(RatingCell.self, forCellWithReuseIdentifier: RatingCell.reuseIdentifier)
      collectionView.reloadData()
    } else {
      collectionView.register(AchieveCell.self, forCellWithReuseIdentifier: AchieveCell.reuseIdentifier)
      collectionView.reloadData()
    }
  }
}



extension AchieveView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    switch segmented.selectedSegmentIndex {
    case 0:
      return achievments.count
    case 1:
      return ratings.count
    default:
      return achievments.count
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch segmented.selectedSegmentIndex {
    case 0:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchieveCell.reuseIdentifier, for: indexPath) as! AchieveCell
      cell.configure(achieve: achievments[indexPath.row])
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RatingCell.reuseIdentifier, for: indexPath) as! RatingCell
      cell.configure(rating: ratings[indexPath.row])
      
      return cell
    default:
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchieveCell.reuseIdentifier, for: indexPath) as! AchieveCell
      cell.configure(achieve: achievments[indexPath.row])
      
      return cell
    }
    
  }
  
  
}

extension AchieveView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    let width = collectionView.frame.width - 30
    
    switch segmented.selectedSegmentIndex {
      
    case 0:
      return CGSize(width: width, height: 90)
    case 1:
      return CGSize(width: width, height: 120)
    default:
      return CGSize(width: width, height: 90)
    }
  }
}

