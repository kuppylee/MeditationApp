//
//  Extension+SignInEmailViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit

extension SignInEmailViewController {
  func setupSigninEmailScreenConstraint() {
    view.addSubview(emailTextField)
    view.addSubview(signInButton)
    view.addSubview(emailLabel)
    view.addSubview(instructionLabel)
    view.addSubview(validationLabel)
    view.addSubview(topBackArrowButton)
    view.addSubview(signInForwardArrowButton)
    view.addSubview(authenticationLabel)
    view.addSubview(createAccountButton)
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      validationLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4),
      validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -5),
      emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailTextField.heightAnchor.constraint(equalToConstant: 52),
      emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      signInForwardArrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -42),
      signInForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
      signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
      signInButton.heightAnchor.constraint(equalToConstant: 52),
      authenticationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
      authenticationLabel.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 25),
      createAccountButton.leadingAnchor.constraint(equalTo: authenticationLabel.trailingAnchor, constant: 4),
      createAccountButton.bottomAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30)
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
