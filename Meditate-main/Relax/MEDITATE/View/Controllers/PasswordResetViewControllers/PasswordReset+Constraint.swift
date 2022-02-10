//
//  PasswordReset+Constraint.swift
//  MEDITATE
//
//  Created by Decagon on 27/09/2021.
//

import UIKit
// MARK: - Constriants
extension PasswordResetViewController {
  func addDefaultViews() {
    view.addSubview(instructionHeadingTextLabel)
    view.addSubview(backButton)
    view.addSubview(passwordTextField)
    view.addSubview(passwordLabel)
    view.addSubview(resetPasswordButton)
    view.addSubview(forwardButton)
    view.addSubview(showPasswordButton)
    view.addSubview(passwordStrengthProgressBar)
    view.addSubview(passwordStrengthDescriptionLabel)
    view.backgroundColor = .white
    view.addSubview(uppercaseAndCharacterCountStack)
    view.addSubview(numberAndSpecialCharacterStack)
  }
  func constraintViews() {
    addDefaultViews()
    NSLayoutConstraint.activate([
      instructionHeadingTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      instructionHeadingTextLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
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
      resetPasswordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
      resetPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      resetPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      resetPasswordButton.heightAnchor.constraint(equalToConstant: 52),
      forwardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
      forwardButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
      forwardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      forwardButton.heightAnchor.constraint(equalToConstant: 52),
      showPasswordButton.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
      showPasswordButton.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: -20),
      passwordStrengthDescriptionLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
      passwordStrengthDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordStrengthDescriptionLabel.heightAnchor.constraint(equalToConstant: 15),
      passwordStrengthProgressBar.heightAnchor.constraint(equalToConstant: 2),
      passwordStrengthProgressBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      passwordStrengthProgressBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
      passwordStrengthProgressBar.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 90),
      uppercaseAndCharacterCountStack.topAnchor.constraint(equalTo: passwordStrengthProgressBar.bottomAnchor, constant: 30),
      uppercaseAndCharacterCountStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      uppercaseAndCharacterCountStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -49),
      uppercaseAndCharacterCountStack.heightAnchor.constraint(equalToConstant: 52),
      numberAndSpecialCharacterStack.topAnchor.constraint(equalTo: uppercaseAndCharacterCountStack.bottomAnchor, constant: 15),
      numberAndSpecialCharacterStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      numberAndSpecialCharacterStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -61),
      numberAndSpecialCharacterStack.heightAnchor.constraint(equalToConstant: 52)
    ])
  }
  class PaddedPasswordTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }
}
