//
//  UIView+Extension.swift
//  PagingViewsTutorial
//
//  Created by FOLAHANMI KOLAWOLE on 28/09/2021.
//

import UIKit

extension UIView {
  func pin(to view: UIView) {
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
}
