//
//  CatalogViewController.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//


import UIKit


class CatalogViewController: UIViewController {
  
  private var fortunaView = FortunaAlert()
  private var catalogView: CatalogView {
    return self.view as! CatalogView
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nil, bundle: nil)
    title = "Каталог"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = CatalogView()
    catalogView.didSelectRowDelegate = self
    setSearchNavigationButton()
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      self.fortunaView.clipsToBounds = true
      self.fortunaView.layer.cornerRadius = 8
      self.view.addSubview(self.fortunaView)
    }
  }
  
  func setSearchNavigationButton() {
    let searchNavigationButton = UIBarButtonItem(image: UIImage(named: "search1.png"), style: .plain, target: self, action: #selector(searchPlace))
    
    navigationItem.rightBarButtonItem = searchNavigationButton
  }
  
  @objc func searchPlace() {
    
  }
  

  
  
  
  override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransition(to: size, with: coordinator)
    catalogView.viewOrientationDidChange()
  }
  
}

extension CatalogViewController: DidSelectRowDelegate {
  func didSelectRow(indexPath: IndexPath) {
    
  }
}
