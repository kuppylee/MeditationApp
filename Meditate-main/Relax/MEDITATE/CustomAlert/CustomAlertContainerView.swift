//
//  GFAlertContainerView.swift
//  GHFollowers
//
//  Created by DECAGON  on 21/10/2021.
//

import UIKit

class CustomAlertContainerView: UIView {
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  init() {
    super.init(frame: .zero)
    configure()
  }
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    backgroundColor = .systemBackground
    layer.cornerRadius = 32
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }
}
