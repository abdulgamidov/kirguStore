//
//  CatalogPresenter.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import Foundation


protocol CatalogPresenterProtocol {
  func getCatalog()
}

class CatalogPresenter: CatalogPresenterProtocol {
  
  let view: CatalogViewProtocol!
  let networkManager: NetworkManager!
  
  init(view: CatalogViewProtocol) {
    self.view = view
    networkManager = NetworkManager()
  }
  
  func getCatalog() {
    networkManager.request(api: .getCatalogList, success: { (catalog) in
      self.view.showCatalog(catalog: catalog)
    }) { (error) in
      print(error)
    }
  }
  
}
