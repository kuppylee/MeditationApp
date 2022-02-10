//
//  CustomAlertVC.swift
//  CustomAlert
//
//  Created by DECAGON 22/10/2021.
//

import UIKit

protocol CustomAlertVCDelegate: AnyObject {
  func dismissAlertAndGoToAnotherScreen()
}
class CustomAlertVC: UIViewController {
  // MARK: - PROPERTIES
  let containerView = CustomAlertContainerView()
  let titleLabel = CustomAlertTitleLabel(textAlignment: .center, fontSize: 30)
  let messageLabel = CustomAlertBodyLabel(textAlignment: .center)
  let callToActionButton = CustomAlertButton(backgroundColor: .black, title: "OK")
  let imageOnAlert = CustomAlertImage(imageNamed: "ok")
  let padding: CGFloat = 20
  var alertTitle: String?
  var alertMessage: String?
  var alertButtonTitle: String?
  var alertImageNamed: String?
  weak var delegate: CustomAlertVCDelegate?
  // MARK: - INITIALIZERS
  init(title: String, message: String, buttonTitle: String, imageNamed: String, arrowBtn: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.alertButtonTitle = buttonTitle
        self.alertImageNamed = imageNamed
          if arrowBtn == false {
              arrowButton.setBackgroundImage(UIImage(), for: .normal)
          } else {
              arrowButton.setBackgroundImage(UIImage(named: "Go-forward-1"), for: .normal)
          }
      }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - VIEW LIFECYCLE METHODS
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    layoutSubviews()
  }
  // MARK: - ARROW BUTTON
  let arrowButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(named: "Go-forward-1"), for: .normal)
        return button
      }()
  // MARK: - CUSTOM FUNCTIONS
  @objc func dismissVC() {
    dismiss(animated: true)
   delegate?.dismissAlertAndGoToAnotherScreen()
  }
  func configureContainerView() {
    view.addSubview(containerView)
    NSLayoutConstraint.activate([
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.widthAnchor.constraint(equalToConstant: 380),
      containerView.heightAnchor.constraint(equalToConstant: 420)
    ])
  }
  func configureImage() {
    containerView.addSubview(imageOnAlert)
    imageOnAlert.setImage(UIImage(named: alertImageNamed ?? "Something went wrong!" ), for: .normal)
    NSLayoutConstraint.activate([
      imageOnAlert.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      imageOnAlert.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      imageOnAlert.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      imageOnAlert.heightAnchor.constraint(equalToConstant: 100)
    ])
  }
  func configureTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.text = alertTitle ?? "Something went wrong!"
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 150),
      titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      titleLabel.heightAnchor.constraint(equalToConstant: 28)
    ])
  }
  func configureCallToActionButton() {
        containerView.addSubview(callToActionButton)
        callToActionButton.setTitle(alertButtonTitle ?? "OK", for: .normal)
        callToActionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        callToActionButton.addSubview(arrowButton)

        NSLayoutConstraint.activate([
          callToActionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
          callToActionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
          callToActionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
          callToActionButton.heightAnchor.constraint(equalToConstant: 55),
          arrowButton.centerYAnchor.constraint(equalTo: callToActionButton.centerYAnchor),
          arrowButton.trailingAnchor.constraint(equalTo: callToActionButton.trailingAnchor, constant: -padding)
        ])
      }
  func configureMessageLabel() {
    containerView.addSubview(messageLabel)
    messageLabel.text = alertMessage ?? "Some other alert message, if alert message isn't passed when the custom alert is called"
    messageLabel.numberOfLines = 4
    NSLayoutConstraint.activate([
      messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
      messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
      messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
      messageLabel.bottomAnchor.constraint(equalTo: callToActionButton.topAnchor, constant: -102)
    ])
  }
  func layoutSubviews() {
    configureContainerView()
    configureTitleLabel()
    configureCallToActionButton()
    configureMessageLabel()
    configureImage()
  }
}
