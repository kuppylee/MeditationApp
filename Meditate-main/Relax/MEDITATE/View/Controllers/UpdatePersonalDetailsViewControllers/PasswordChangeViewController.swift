//
//  PasswordChangeViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

class PasswordChangeViewController: UIViewController {
  var email: String = ""
  // MARK: - PAGE TITLE LABEL
  let instructionLabel: UILabel = {
    let label = UILabel()
    label.text = "Enter your \n current password"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    label.numberOfLines = 2
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - PASSWORD LABEL
  let passwordLabel: UILabel = {
    let label = UILabel()
    label.text = "Password"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - PASSWORD VALIDATION DESCRIPTION LABEL
  let validationLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .black
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - PASSWORD TEXT FIELD TO COLLECT USER INPUTS
  let passwordTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = .white
    textField.layer.borderWidth = 1
    textField.isSecureTextEntry = true
    textField.autocapitalizationType = .none
    textField.layer.cornerRadius = 24
    textField.placeholder = "Qwerty123"
    textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    return textField
  }()
  // MARK: - CURRENT PASSWORD VALIDATION CHECK BUTTON
  let currentPasswordSignInButton: UIButton = {
    let button = UIButton(type: .system)
    button.backgroundColor = .black
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Continue", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 24
    return button
  }()
  // MARK: - TOP BACK ARROW TO GO BACK TO THE PREVIOUS PAGE
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - SIGN IN FORWARD ARROW BUTTON
  let signInForwardArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
    return button
  }()
  // MARK: - PASSWORD VISIBILITY BUTTON
  let passwordVisibilityButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapPasswordVisibilityButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.closedFocus.image, for: .normal)
    return button
  }()
  // MARK: - PASSWORD ENCRYPTION BUTTON
  let passwordVisibilityNoFocusButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapVisibilityNoFocusButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.openFocus.image, for: .normal)
    button.isHidden = true
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppColors.white.color
    setupPasswordChangeScreenConstraint()
    self.hideKeyboardWhenTappedAround()
  }
  // MARK: - VALIDATE INPUT FUNCTION
  @objc func validateViews(_ textField: UITextField) {
    let text = passwordTextField.text
    let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,10}$"
    let textTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    let passwordResult = textTest.evaluate(with: text)
    if passwordResult {
      validationLabel.text = "correct password"
      validationLabel.textColor = AppColors.green.color
      passwordTextField.layer.borderColor = AppColors.green.color.cgColor
      currentPasswordSignInButton.backgroundColor = AppColors.black.color
      currentPasswordSignInButton.isEnabled =  true
    } else if text?.isEmpty == true {
      validationLabel.isHidden = true
      passwordTextField.layer.borderColor = AppColors.black.color.cgColor
      currentPasswordSignInButton.backgroundColor = AppColors.grayedOutButton.color
      currentPasswordSignInButton.isEnabled =  false
    } else {
      validationLabel.text = "Incorrect password"
      passwordTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.isHidden = false
      currentPasswordSignInButton.backgroundColor = AppColors.grayedOutButton.color
      currentPasswordSignInButton.isEnabled =  false
    }
  }
  @objc func textFieldDidChange(_ textField: UITextField) {
    validateViews(passwordTextField)
  }
  // MARK: - Function to sign in
  @objc func didTapSignInButton() {
    if passwordTextField.text == "" {
      passwordTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.text = "Please enter a valid password"
    } else {
      navigationController?.pushViewController(CreateNewPasswordViewController(), animated: true)
    }
  }
  // MARK: - IMPLEMENT PASSWORD VISIBILITY TOGGLE FUNCTION
  @objc func didTapPasswordVisibilityButton() {
    passwordTextField.isSecureTextEntry = false
    passwordVisibilityNoFocusButton.isHidden = false
  }
  @objc func didTapVisibilityNoFocusButton() {
    passwordTextField.isSecureTextEntry = true
    passwordVisibilityNoFocusButton.isHidden = true
    passwordVisibilityButton.isHidden = false
  }
  // MARK: - IMPLEMENT BACK ARROW BUTTON FUNCTION
  @objc func didTapTopBackArrowButton() {
    navigationController?.popViewController(animated: true)
  }
}
