//
//  Extension+EmailUpdateViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

extension EmailUpdateViewController {
  // MARK: - FUNCTION TO SETUP VIEWS ON THE SCREEN
  func setupViews() {
    view.addSubview(emailUpdateTextField)
    view.addSubview(updateEmailButton)
    view.addSubview(emailLabel)
    view.addSubview(instructionLabel)
    view.addSubview(validationLabel)
    view.addSubview(topBackArrowButton)
    view.addSubview(updateEmailForwardArrowButton)
  }
  // MARK: - FUNCTION TO SETUP VIEW'S CONSTRAINTS 
  func setupSigninEmailScreenConstraint() {
    setupViews()
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      validationLabel.topAnchor.constraint(equalTo: emailUpdateTextField.bottomAnchor, constant: 4),
      validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      emailLabel.bottomAnchor.constraint(equalTo: emailUpdateTextField.topAnchor, constant: -5),
      emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      emailUpdateTextField.heightAnchor.constraint(equalToConstant: 52),
      emailUpdateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      emailUpdateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      emailUpdateTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailUpdateTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      updateEmailForwardArrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
      updateEmailForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
      updateEmailButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
      updateEmailButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      updateEmailButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      updateEmailButton.heightAnchor.constraint(equalToConstant: 52)
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
