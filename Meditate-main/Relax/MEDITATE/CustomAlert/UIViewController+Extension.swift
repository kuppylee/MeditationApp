//
//  UIViewController+Extension.swift
//  CustomAlert
//
//  Created by DECAGON  on 22/10/2021.
//

import UIKit

extension UIViewController {
  func presentCustomAlertOnMainThread(title: String, message: String, buttonTitle: String, imageNamed: String, arrowBtn: Bool) {
    DispatchQueue.main.async {
      let alertVC = CustomAlertVC(title: title, message: message, buttonTitle: buttonTitle, imageNamed: imageNamed, arrowBtn: arrowBtn)
      alertVC.delegate = self as? CustomAlertVCDelegate
      alertVC.modalPresentationStyle = .overFullScreen
      alertVC.modalTransitionStyle = .crossDissolve
      self.present(alertVC, animated: true)
    }
  }
}

