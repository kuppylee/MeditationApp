//
//  SignInEmailViewController.swift
//  MEDITATE
//
//  Created by FOLAHANMI KOLAWOLE on 23/09/2021.
//

import UIKit

class SignInEmailViewController: UIViewController {
  let instructionLabel: UILabel = {
    let label = UILabel()
    label.text = "Please enter your \n email address"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let validationLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .black
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let emailTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = AppColors.white.color
    textField.layer.borderWidth = 1
    textField.layer.borderColor =  AppColors.black.color.cgColor
    textField.keyboardType = .emailAddress
    textField.layer.cornerRadius = 24
    textField.autocapitalizationType = .none
    textField.placeholder = "johnsmith@gmail.com"
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged )
    return textField
  }()
  let signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Continue", for: .normal)
    button.setTitleColor(AppColors.white.color, for: .normal)
    button.layer.cornerRadius = 24
    button.backgroundColor = AppColors.black.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    button.isEnabled = true
    return button
  }()
  let authenticationLabel: UILabel = {
    let label = UILabel()
    label.text = "Don't have an accout?"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 12)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let createAccountButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Sign Up", for: .normal)
    button.setTitleColor(AppColors.black.color, for: .normal)
    button.backgroundColor = AppColors.white.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 12)
    button.isEnabled = true
    return button
  }()
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapOnboardingButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  let signInForwardArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
    return button
  }()
  func validateEmail() {
    let text = emailTextField.text
    let emailRegEx  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let textTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    let emailResult = textTest.evaluate(with: text)
    if emailResult {
      validationLabel.text = "correct email"
      validationLabel.textColor = AppColors.green.color
      emailTextField.layer.borderColor = AppColors.green.color.cgColor
      signInButton.backgroundColor = AppColors.black.color
      signInButton.isEnabled =  true
    } else if text?.isEmpty == true {
      validationLabel.isHidden = true
      emailTextField.layer.borderColor = AppColors.black.color.cgColor
      signInButton.backgroundColor = AppColors.grayedOutButton.color
      signInButton.isEnabled =  false
    } else {
      validationLabel.text = "Please enter a valid email"
      emailTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.isHidden = false
      signInButton.backgroundColor = AppColors.grayedOutButton.color
      signInButton.isEnabled =  false
    }
  }
  @objc func textFieldDidChange(_ textField: UITextField) {
    validateEmail()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppColors.white.color
    setupSigninEmailScreenConstraint()
    self.hideKeyboardWhenTappedAround()
  }
  // MARK: - ... Function to segue to the password screen
  @objc func didTapSignInButton() {
    if emailTextField.text == "" {
      emailTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.text = "Please enter a valid email"
    } else {
      let newController = SignInPasswordViewController()
      newController.email = emailTextField.text!
      navigationController?.pushViewController(newController, animated: true)
    }
  }
  @objc func didTapSignUpButton() {
    let newController = SignUpEmailViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  @objc func didTapOnboardingButton() {
  }
}
