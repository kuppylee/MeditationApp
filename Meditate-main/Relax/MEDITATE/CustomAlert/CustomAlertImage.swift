//
//  CustomAlertImage.swift
//  CustomAlert
//
//  Created by DECAGON  on 23/10/2021.
//

import UIKit

class CustomAlertImage: UIButton {
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  init(imageNamed: String) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setImage(UIImage(named: imageNamed), for: .normal)
    configure()
  }
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 27
    translatesAutoresizingMaskIntoConstraints = false
  }
}
