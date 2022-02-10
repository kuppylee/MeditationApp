//
//  GFButton.swift
//  GHFollowers
//
//  Created by DECAGON  on 18/10/2021.
//

import UIKit
class CustomAlertButton: UIButton {
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  init(backgroundColor: UIColor, title: String) {
    super.init(frame: .zero)
    self.backgroundColor = backgroundColor
    self.setTitle(title, for: .normal)
    configure()
  }
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    layer.cornerRadius = 27
    titleLabel?.textColor = .white
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    translatesAutoresizingMaskIntoConstraints = false
  }
}
