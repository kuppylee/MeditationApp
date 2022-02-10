//
//  TabBarsViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class TabBarsViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
      let  exploreViewController = ExploreViewController()
      self.setViewControllers([exploreViewController], animated: false)
      guard let itemsInTab = self.tabBar.items else { return }
      let images = ["Search"]
      for icon in 0 ..< 1 {
        itemsInTab[icon].image = UIImage(named: images[icon])
      }
      self.tabBar.tintColor =  AppColors.black.color
      self.tabBar.backgroundColor = AppColors.white.color
    }
}
