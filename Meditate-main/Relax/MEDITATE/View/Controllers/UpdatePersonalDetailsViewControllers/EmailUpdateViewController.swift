//
//  EmailUpdateViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

class EmailUpdateViewController: UIViewController {
  // MARK: - PAGE TITLE LABEL
  let instructionLabel: UILabel = {
    let label = UILabel()
    label.text = "Update your \n email"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - EMAIL LABEL
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - INPUT VALIDATION DESCRIPTION TEXT LABEL
  let validationLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .black
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - EMAIL UPDATE TEXT FIELD TO COLLECT EMAIL INPUT FROM USERS
  let emailUpdateTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = AppColors.white.color
    textField.layer.borderWidth = 1
    textField.layer.borderColor =  AppColors.black.color.cgColor
    textField.isUserInteractionEnabled = false
    textField.keyboardType = .emailAddress
    textField.layer.cornerRadius = 24
    textField.autocapitalizationType = .none
    textField.placeholder = "johnsmith@gmail.com"
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged )
    return textField
  }()
  // MARK: - BUTTON FOR EMAIL UPDATE
  let updateEmailButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Update", for: .normal)
    button.setTitleColor(AppColors.white.color, for: .normal)
    button.layer.cornerRadius = 24
    button.backgroundColor = AppColors.black.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    button.isEnabled = true
    return button
  }()
  // MARK: - THE PAGE'S TOP BACK ARROW BUTTON TO GO BACK TO THE PREVIOUS PAGE
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapPersonalDetailsButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - UPDATE EMAIL FORWARD ARROW BUTTON
  let updateEmailForwardArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
    return button
  }()
  // MARK: - FUNCTION TO VALIDATE USER EMAIL INPUT
  func validateEmail() {
    let text = emailUpdateTextField.text
    let emailRegEx  = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let textTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    let emailResult = textTest.evaluate(with: text)
    if emailResult {
      validationLabel.text = "correct email"
      validationLabel.textColor = AppColors.green.color
      emailUpdateTextField.layer.borderColor = AppColors.green.color.cgColor
      updateEmailButton.backgroundColor = AppColors.black.color
      updateEmailButton.isEnabled =  true
    } else if text?.isEmpty == true {
      validationLabel.isHidden = true
      emailUpdateTextField.layer.borderColor = AppColors.black.color.cgColor
      updateEmailButton.backgroundColor = AppColors.grayedOutButton.color
      updateEmailButton.isEnabled =  false
    } else {
      validationLabel.text = "Please enter a valid email"
      emailUpdateTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.isHidden = false
      updateEmailButton.backgroundColor = AppColors.grayedOutButton.color
      updateEmailButton.isEnabled =  false
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
    if emailUpdateTextField.text == "" {
      emailUpdateTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.text = "Please enter a valid email"
    } else {
      presentCustomAlertOnMainThread(title: "Email Updated", message: "You have successfully updated \n your email", buttonTitle: "Done", imageNamed:  "Message-Icon", arrowBtn: false)
    }
  }
  @objc func didTapPersonalDetailsButton() {
    navigationController?.popViewController(animated: true)
  }
}
