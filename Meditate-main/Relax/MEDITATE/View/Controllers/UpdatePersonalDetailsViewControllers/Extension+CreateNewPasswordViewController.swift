//
//  Extension+CreateNewPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

extension CreateNewPasswordViewController {
  // MARK: - VALIDATION FOR SIX CHARACTER INPUT FUNCTION
  func validateSixCharacters() {
    guard let text = passwordTextField.text else { return }
    if (text.count > 5) == true {
      sixCharacterValidation.textColor = AppColors.green.color
      sixCharacterValidation.layer.borderColor = AppColors.green.color.cgColor
    } else {
      sixCharacterValidation.textColor = AppColors.red.color
      sixCharacterValidation.layer.borderColor = AppColors.red.color.cgColor
    }
  }
  // MARK: - VALIDATION FOR UPPERCASE INPUT FUNCTION
  func validateUppercaseLetter() {
    guard let text = passwordTextField.text else { return }
    let capitalLetterRegEx  = ".*[A-Z]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
    let upperCaseResult = textTest.evaluate(with: text)
    if upperCaseResult == true {
      oneUpperCaseValidation.textColor = AppColors.green.color
      oneUpperCaseValidation.layer.borderColor = AppColors.green.color.cgColor
    } else {
      oneUpperCaseValidation.textColor = AppColors.red.color
      oneUpperCaseValidation.layer.borderColor = AppColors.red.color.cgColor
    }
  }
  // MARK: - VALIDATION FOR NUMBER INPUT FUNCTION
  func validateNumber() {
    guard let text = passwordTextField.text else { return }
    let numberRegEx  = ".*[0-9]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", numberRegEx)
    let numberResult = textTest.evaluate(with: text)
    if numberResult == true {
      oneNumberValidation.textColor = AppColors.green.color
      oneNumberValidation.layer.borderColor = AppColors.green.color.cgColor
    } else {
      oneNumberValidation.textColor = AppColors.red.color
      oneNumberValidation.layer.borderColor = AppColors.red.color.cgColor
    }
  }
  // MARK: - VALIDATION FOR SPECIAL CHARACTER FUNCTION
  func validateSpecialCharacter() {
    guard let text = passwordTextField.text else { return }
    let specialCharacterRegEx  = ".*[!&^%$#@()/]+.*"
    let textTest = NSPredicate(format: "SELF MATCHES %@", specialCharacterRegEx)
    let specialCharacterResult = textTest.evaluate(with: text)
    if specialCharacterResult == true {
      oneSpecialCharacterValidation.textColor = AppColors.green.color
      oneSpecialCharacterValidation.layer.borderColor = AppColors.green.color.cgColor
    } else {
      oneSpecialCharacterValidation.textColor = AppColors.red.color
      oneSpecialCharacterValidation.layer.borderColor = AppColors.red.color.cgColor
    }
  }
  // MARK: - VALIDATION FOR PASSWORD STRENGTH BAR FUNCTION
  func validateStrengthBar() {
    guard let text = passwordTextField.text else { return }
    var strength: Float = 0.079
    if sixCharacterValidation.textColor == AppColors.green.color {
      strength += 0.160
    }
    if oneUpperCaseValidation.textColor == AppColors.green.color {
      strength += 0.160
    }
    if oneNumberValidation.textColor == AppColors.green.color {
      strength += 0.160
    }
    if oneSpecialCharacterValidation.textColor == AppColors.green.color {
      strength += 0.160
    }
    if strength >= 0.714 && text.count >= 9 {
      strength = 1.000
    }
    passwordStrengthBar.setProgress(strength, animated: true)
    if strength >= 0.714 {
      passwordStrengthBar.tintColor = AppColors.green.color
    } else {
      passwordStrengthBar.tintColor = AppColors.red.color
    }
  }
  // MARK: - FUNCTION FOR PASSWORD DESCRIPTION TEXT LABEL
  func validateAllOtherFields() {
    if sixCharacterValidation.textColor == AppColors.green.color &&
        oneUpperCaseValidation.textColor == AppColors.green.color &&
        oneNumberValidation.textColor == AppColors.green.color &&
        oneSpecialCharacterValidation.textColor == AppColors.green.color {
      passwordTextField.layer.borderColor = AppColors.green.color.cgColor
      passwordDescriptionLabel.text = "Strong password"
      passwordDescriptionLabel.textColor = AppColors.green.color
    } else {
      passwordTextField.layer.borderColor = AppColors.red.color.cgColor
      passwordDescriptionLabel.text = "Weak password"
      passwordDescriptionLabel.textColor = AppColors.red.color
    }
  }
  // MARK: - VALIDATION FOR SUCCESSFUL ACCOUNT CREATION
  func validateAccountCreationButton() {
    if passwordDescriptionLabel.textColor == AppColors.green.color {
      continueToAccountCreation.isEnabled = true
      continueToAccountCreation.backgroundColor = AppColors.black.color
      continueToAccountCreation.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
    } else {
      continueToAccountCreation.isEnabled = false
      continueToAccountCreation.backgroundColor = AppColors.grayedOutButton.color
    }
  }
  // MARK: - FUNCTION TO POP UP THE SUCCESSFUL PASSWORD UPDATE CUSTOM ALERT
  @objc func didTapUpdateButton() {
    presentCustomAlertOnMainThread(title: "Password Updated", message: "You have successfully updated \nyour password", buttonTitle: "Done", imageNamed: "Large-Password", arrowBtn: false)
  }
  // MARK: - FUNCTION TO ADD VIEWS TO SCREEN
  func addViews() {
    view.backgroundColor = AppColors.white.color
    view.addSubview(continueToAccountCreation)
    view.addSubview(backButton)
    view.addSubview(enterPasswordHeader)
    view.addSubview(passwordTextField)
    view.addSubview(passwordLabel)
    view.addSubview(passwordDescriptionLabel)
    view.addSubview(passwordStrengthBar)
    view.addSubview(topStack)
    view.addSubview(bottomStack)
    view.addSubview(toggleButton)
  }
  // MARK: - FUNCTION TO CONSTRAIN VIEWS ON SCREEN
  func setupConstraints() {
    NSLayoutConstraint.activate([
      continueToAccountCreation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      continueToAccountCreation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
      continueToAccountCreation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      continueToAccountCreation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
      enterPasswordHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      enterPasswordHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
      passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
      passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -10),
      passwordLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor),
      passwordDescriptionLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
      passwordDescriptionLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor),
      passwordStrengthBar.topAnchor.constraint(equalTo: passwordDescriptionLabel.bottomAnchor, constant: 10),
      passwordStrengthBar.heightAnchor.constraint(equalToConstant: 2),
      passwordStrengthBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      passwordStrengthBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      topStack.topAnchor.constraint(equalTo: passwordStrengthBar.bottomAnchor, constant: 30),
      topStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      topStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -49),
      bottomStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 15),
      bottomStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      bottomStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -61),
      toggleButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
      toggleButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20)
    ])
  }
}
