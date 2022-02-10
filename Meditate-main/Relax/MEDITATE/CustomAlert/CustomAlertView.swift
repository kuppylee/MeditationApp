//
//  CustomAlertView.swift
//  PagingViewsTutorial
//
//  Created by FOLAHANMI KOLAWOLE on 29/09/2021.
//

import UIKit

class CustomAlertView: UIView {
  @IBOutlet var parentView: UIView!
  @IBOutlet weak var customAlertView: UIView!
  @IBOutlet weak var imageView: RoundedImage!
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var subHeaderLabel: UILabel!
  @IBOutlet weak var actionBtn: MyButton!
  weak var delegate: CustomProtocol?
  static let shared = CustomAlertView()
  override init(frame: CGRect) {
    super.init(frame: frame)
    Bundle.main.loadNibNamed("CustomAlertView", owner: self, options: nil)
    commonInit()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func commonInit() {
    parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
  }
  func showCustomAlert(title: String, message: String, customAlertType: CustomAlertType? = nil) {
    headerLabel.text = title
    subHeaderLabel.text = message
    UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.addSubview(parentView)
  }
  @IBAction func didTapSendLink(_ sender: Any) {
//    parentView.removeFromSuperview()
    delegate?.didTapSendLink(view: parentView)
  }
  enum CustomAlertType {
    case resetPassword
    case linkSent
  }
}
protocol CustomProtocol: AnyObject {
  func didTapSendLink(view: UIView)
}
