//
//  AppDelegate.swift
//  kirguStore
//
//  Created by Rizabek on 22.02.2020.
//  Copyright © 2020 Rizabek Abdulgamidov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  private var catalogTabNavigationController: UINavigationController!
  private var achieveTabNavigationController: UINavigationController!
  private var searchTabNavigationController: UINavigationController!
  private var basketTabNavigationController: UINavigationController!
  private var profileTabNavigationController: UINavigationController!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    window!.backgroundColor = UIColor.white
    
    let tabBarController = UITabBarController()
    
    catalogTabNavigationController = UINavigationController.init(rootViewController: CatalogViewController())
    let itemCatalog = UITabBarItem(title: "Товары", image: UIImage(named: "catalog"), tag: 0)
    catalogTabNavigationController.tabBarItem = itemCatalog
    
    achieveTabNavigationController = UINavigationController.init(rootViewController: AchieveViewController())
    let itemAchieve = UITabBarItem(title: "Достижения", image: UIImage(named: "achieve"), tag: 0)
    achieveTabNavigationController.tabBarItem = itemAchieve
    
    
    tabBarController.viewControllers = [catalogTabNavigationController, achieveTabNavigationController]
    
    
    
    UITabBar.appearance().tintColor = #colorLiteral(red: 0.8588235294, green: 0.1882352941, blue: 0.1333333333, alpha: 1)
    window!.rootViewController = tabBarController
    window!.makeKeyAndVisible()
    
    return true
  }



}

