//
//  Extension+FullnameUpdateViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit
extension FullnameUpdateViewController {
  // MARK: - SETUP VIEWS FUNCTION
  func setupViews() {
    view.addSubview(fullnameTextField)
    view.addSubview(updateFullnameButton)
    view.addSubview(fullnameLabel)
    view.addSubview(instructionLabel)
    view.addSubview(validationLabel)
    view.addSubview(topBackArrowButton)
    view.addSubview(updateFullnameForwardArrowButton)
  }
  // MARK: - SETUP CONSTRAINTS FUNCTION
  func setupFullnameUpdateScreenConstraint() {
    setupViews()
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      instructionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      validationLabel.topAnchor.constraint(equalTo: fullnameTextField.bottomAnchor, constant: 4),
      validationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      fullnameLabel.bottomAnchor.constraint(equalTo: fullnameTextField.topAnchor, constant: -5),
      fullnameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      fullnameTextField.heightAnchor.constraint(equalToConstant: 52),
      fullnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      fullnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      fullnameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      fullnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      updateFullnameForwardArrowButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
      updateFullnameForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45),
      updateFullnameButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
      updateFullnameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      updateFullnameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      updateFullnameButton.heightAnchor.constraint(equalToConstant: 52)
    ])
  }
}
class LeftPaddedTextField: UITextField {
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
  }
}
