//
//  Extension+SignInPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit

extension SignInPasswordViewController {
  func setupSigninPasswordSreenConstraint() {
    view.addSubview(passwordTextField)
    view.addSubview(signInButton)
    view.addSubview(passwordLabel)
    view.addSubview(instructionLabel)
    view.addSubview(validationLabel)
    view.addSubview(forgotPasswordButton)
    view.addSubview(topBackArrowButton)
    view.addSubview(signInForwardArrowButton)
    view.addSubview(signInVisibilityButton)
    view.addSubview(signInVisibilityNoFocusButton)
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      validationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4),
      validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5),
      passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      signInVisibilityButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 17),
      signInVisibilityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      signInVisibilityNoFocusButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 17),
      signInVisibilityNoFocusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      passwordTextField.heightAnchor.constraint(equalToConstant: 52),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      forgotPasswordButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -10),
      forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      forgotPasswordButton.heightAnchor.constraint(equalToConstant: 52),
      signInForwardArrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -42),
      signInForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
      signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      signInButton.heightAnchor.constraint(equalToConstant: 52)
    ])
  }
  class LeftPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
      return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
  }
}
