//
//  Extension+PasswordChangeViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

extension PasswordChangeViewController {
  // MARK: - PAGE VIEWS SETUP
  func setupViews () {
    view.addSubview(passwordTextField)
    view.addSubview(currentPasswordSignInButton)
    view.addSubview(passwordLabel)
    view.addSubview(instructionLabel)
    view.addSubview(validationLabel)
    view.addSubview(topBackArrowButton)
    view.addSubview(signInForwardArrowButton)
    view.addSubview(passwordVisibilityButton)
    view.addSubview(passwordVisibilityNoFocusButton)
  }
  // MARK: - PAGE CONSTRIANTS SETUP
  func setupPasswordChangeScreenConstraint() {
    setupViews()
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      validationLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 4),
      validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -5),
      passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordVisibilityButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 17),
      passwordVisibilityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      passwordVisibilityNoFocusButton.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 17),
      passwordVisibilityNoFocusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      passwordTextField.heightAnchor.constraint(equalToConstant: 52),
      passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      signInForwardArrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
      signInForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
      currentPasswordSignInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
      currentPasswordSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      currentPasswordSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      currentPasswordSignInButton.heightAnchor.constraint(equalToConstant: 52)
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
