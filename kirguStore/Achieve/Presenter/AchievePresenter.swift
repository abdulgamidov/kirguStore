//
//  AchievePresenter.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation


protocol AchievePresenterProtocol {
  func getAchieveList()
  func getRatingList()
}


class AchievePresenter: AchievePresenterProtocol {
 
  let view: AchiewViewProtocol!
  let networkManager: NetworkManager!
  
  init(view: AchiewViewProtocol) {
    self.view = view
    self.networkManager = NetworkManager()
  }

  func getAchieveList() {
    networkManager.request(api: .getAchievementList, success: { (achieve) in
      self.view.showAchieveList(achieve: achieve)
    }) { (error) in
      print(error)
    }
  }
  
  func getRatingList() {
    networkManager.request(api: .getRatingList, success: { (rating) in
      self.view.showRatingList(rating: rating)
    }) { (error) in
      print(error)
    }
   }
   
  
}
