//
//  AchieveViewController.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit


class AchieveViewController: UIViewController {
  
  private var achieveView: AchieveView {
      return self.view as! AchieveView
  }

  init() {
      super.init(nibName: nil, bundle: nil)
      title = "Достижения"
  }
   
  required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
  }
  
  override func loadView() {
      view = AchieveView()
  }
}
