//
//  FortunaViewController.swift
//  kirguStore
//
//  Created by Rizabek on 23.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit



class FortunaViewController: UIViewController {
  
  private var fortunaView: FortunaAlert {
    return self.view as! FortunaAlert
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = CatalogView()
    view.clipsToBounds = true
    view.layer.cornerRadius = 8
  }
}
