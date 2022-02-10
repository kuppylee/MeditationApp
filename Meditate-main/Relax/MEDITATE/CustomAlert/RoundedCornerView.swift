//
//  RoundedCornerView.swift
//  PagingViewsTutorial
//
//  Created by FOLAHANMI KOLAWOLE on 29/09/2021.
//

import UIKit
@IBDesignable
class MyView: UIView {
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = cornerRadius
  }
  @IBInspectable var cornerRadius: CGFloat {
    get { return layer.cornerRadius }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = (newValue > 0)
    }
  }
}
@IBDesignable class MyButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = cornerRadius
  }
  @IBInspectable var cornerRadius: CGFloat {
    get { return layer.cornerRadius }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = (newValue > 0)
    }
  }
}

@IBDesignable class RoundedImage: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    updateCornerRadius()
  }
  @IBInspectable var rounded: Bool = false {
    didSet {
      updateCornerRadius()
    }
  }
  @IBInspectable var cornerRadius: CGFloat = 0.1 {
    didSet {
      updateCornerRadius()
    }
  }
  func updateCornerRadius() {
    layer.cornerRadius = rounded ? cornerRadius : 0
    layer.masksToBounds = rounded ? true : false
  }
}
