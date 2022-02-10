//
//  ViewController.swift
//  MEDITATE
//
//  Created by FOLAHANMI KOLAWOLE on 23/09/2021.
//

import UIKit
class ForgotPasswordViewController: UIViewController, CustomProtocol {
  let instructionHeadingTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Please enter your new \n password"
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.textAlignment = .center
    label.numberOfLines = 2
    return label
  }()
  let passwordLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Password"
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    label.numberOfLines = 1
    return label
  }()
  let backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "Go-back"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    return button
  }()
  let passwordTextField: PaddedTextField = {
    let textField = PaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.layer.borderWidth = 1
    textField.isSecureTextEntry = true
    textField.layer.cornerRadius = 25
    textField.font = UIFont(name: "nunito-sans", size: 15)
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  let loginButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    button.layer.cornerRadius = 25
    button.backgroundColor = .black
    button.setTitle("Login", for: .normal)
    return button
  }()
  let forgotPasswordButton: UIButton = {
    let button = UIButton(type: .custom)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    button.layer.cornerRadius = 25
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.borderWidth = 1
    button.backgroundColor = .white
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(didTapforgotPasswordButton), for: .touchUpInside )
    button.setTitle("Forgot Password?", for: .normal)
    return button
  }()
  @objc func  backButtonPressed() {
  }
  //  @objc func didTapGoForwardButton() {
  //
  //  }
  @objc func didTapforgotPasswordButton() {
    //      customAlert.showAlert(setIconName: "message-Icon", title: "Reset Password", message: "We will email you a magic link to \n reset your password", On: self, setbuttonTitle: "Send Links")
    CustomAlertView.shared.delegate = self
    CustomAlertView.shared.showCustomAlert(title: "Reset Password", message: "We will email you a magic link to reset your password.")
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    constraintViews()
  }
  func addDefaultViews() {
    view.addSubview(instructionHeadingTextLabel)
    view.addSubview(backButton)
    view.addSubview(passwordTextField)
    view.addSubview(passwordLabel)
    view.addSubview(loginButton)
    view.addSubview(forgotPasswordButton)
    view.backgroundColor = .white
  }
  func constraintViews() {
    addDefaultViews()
    instructionHeadingTextLabel.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                         left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 89),
      backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.heightAnchor.constraint(equalToConstant: 28),
      backButton.widthAnchor.constraint(equalToConstant: 28),
      passwordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      passwordTextField.heightAnchor.constraint(equalToConstant: 52),
      passwordLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
      passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordLabel.heightAnchor.constraint(equalToConstant: 52),
      loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
      loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      loginButton.heightAnchor.constraint(equalToConstant: 52),
      forgotPasswordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
      forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      forgotPasswordButton.heightAnchor.constraint(equalToConstant: 52)
    ])
  }
}
class PaddedTextField: UITextField {
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
}
