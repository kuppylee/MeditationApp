//
//  SceneDelegate.swift
//  MEDITATE
//
//  Created by FOLAHANMI KOLAWOLE on 23/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let onboardingViewController = OnboardingViewController()
    var navigationController = UINavigationController()
      // MARK: - Checking for user default status to determine first responding screen
    if UserDefaults.standard.bool(forKey: "onboarded") == false {
        navigationController = UINavigationController(rootViewController: onboardingViewController)
    } else if UserDefaults.standard.bool(forKey: Defaults.signedUp.key) == false {
        navigationController = UINavigationController(rootViewController: SignUpEmailViewController())
    } else if UserDefaults.standard.bool(forKey: Defaults.signedIn.key) == false {
        navigationController = UINavigationController(rootViewController: SignInEmailViewController())
    } else {
         navigationController = UINavigationController(rootViewController: TabBarViewController())
    }
    navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController.navigationBar.shadowImage = UIImage()
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
  func sceneDidDisconnect(_ scene: UIScene) {
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
  }

  func sceneWillResignActive(_ scene: UIScene) {
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
  }
}
