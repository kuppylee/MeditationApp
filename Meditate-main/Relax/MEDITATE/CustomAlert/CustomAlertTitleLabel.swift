//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by DECAGON  on 18/10/2021.
//

import UIKit

class CustomAlertTitleLabel: UILabel {
  // MARK: - INITIALIZERS
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.textAlignment = textAlignment
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    configure()
  }
  // MARK: - CUSTOM FUNCTIONS
  private func configure() {
    textColor = .label
    adjustsFontSizeToFitWidth = true
    minimumScaleFactor = 0.9
    lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
}
