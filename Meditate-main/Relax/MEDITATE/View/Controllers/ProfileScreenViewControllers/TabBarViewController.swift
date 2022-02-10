//
//  TabBarViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
// MARK: Create instance of viewControllers
        let homeViewController = HomeScreenViewController()
        let profileViewController = ProfilePageViewController()
        let exploreViewController = ExploreViewController()
// MARK: Assign viewController to tab Bar
      self.setViewControllers([homeViewController, exploreViewController, profileViewController], animated: false)
      guard let items = self.tabBar.items else { return }
      let images = ["Home Icon", "Search", "Profile Icon"]
      for item in 0...2 {
        items[item].image = UIImage(named: images[item])
      }
// MARK: Changing tint Color
      self.tabBar.tintColor = .black
    }
}
