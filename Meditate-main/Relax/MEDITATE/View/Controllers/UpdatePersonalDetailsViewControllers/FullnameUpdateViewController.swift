//
//  FullnameUpdateViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

class FullnameUpdateViewController: UIViewController {
  // MARK: - PAGE TITLE LABEL
  let instructionLabel: UILabel = {
    let label = UILabel()
    label.text = "Update your \n fullname"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - FULLNAME LABEL
  let fullnameLabel: UILabel = {
    let label = UILabel()
    label.text = "Full Name"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - INPUT VALIDATION LABEL
  let validationLabel: UILabel = {
    let label = UILabel()
    label.text = ""
    label.textColor = .black
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TEXTFIELD FOR FULLNAME INPUT
  let fullnameTextField: LeftPaddedTextField = {
    let textField = LeftPaddedTextField()
    textField.layer.borderColor = UIColor.black.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = AppColors.white.color
    textField.layer.borderWidth = 1
    textField.layer.borderColor =  AppColors.black.color.cgColor
    textField.keyboardType = .emailAddress
    textField.layer.cornerRadius = 24
    textField.autocapitalizationType = .none
    textField.placeholder = "John Smith"
    textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged )
    return textField
  }()
  // MARK: - BUTTON TO UPDATE FULLNAME
  let updateFullnameButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapUpdateFullnameButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Update", for: .normal)
    button.setTitleColor(AppColors.white.color, for: .normal)
    button.layer.cornerRadius = 24
    button.backgroundColor = AppColors.black.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    button.isEnabled = true
    return button
  }()
  // MARK: - BACK ARROW BUTTON TO GO BACK TO PREVIOUS PAGE
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapPersonalDetailsButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - UPDATE FULLNAME FORWARD ARROW BUTTON
  let updateFullnameForwardArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapUpdateFullnameButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
    return button
  }()
  // MARK: - CODE FOR INPUT VALIDATION
  func validateFullname() {
    let text = fullnameTextField.text
    let fullnameRegEx  = "^(?=.{5,100}$)[A-Za-zÀ-ú][A-Za-zÀ-ú'-]+(?: [A-Za-zÀ-ú'-]+)* *$"
    let textTest = NSPredicate(format: "SELF MATCHES %@", fullnameRegEx)
    let fullnameResult = textTest.evaluate(with: text)
    if fullnameResult && text?.contains(" ") == true {
      validationLabel.text = "correct fullname"
      validationLabel.textColor = AppColors.green.color
      fullnameTextField.layer.borderColor = AppColors.green.color.cgColor
      updateFullnameButton.backgroundColor = AppColors.black.color
      updateFullnameButton.isEnabled =  true
    } else if text?.isEmpty == true {
      validationLabel.isHidden = true
      fullnameTextField.layer.borderColor = AppColors.black.color.cgColor
      updateFullnameButton.backgroundColor = AppColors.grayedOutButton.color
      updateFullnameButton.isEnabled =  false
    } else {
      validationLabel.text = "Please enter a valid Full Name"
      fullnameTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.isHidden = false
      updateFullnameButton.backgroundColor = AppColors.grayedOutButton.color
      updateFullnameButton.isEnabled =  false
    }
  }
  @objc func textFieldDidChange(_ textField: UITextField) {
    validateFullname()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppColors.white.color
    setupFullnameUpdateScreenConstraint()
    self.hideKeyboardWhenTappedAround()
  }
  // MARK: - ... Function to segue to the password screen
  @objc func didTapUpdateFullnameButton() {
    if fullnameTextField.text == "" {
      fullnameTextField.layer.borderColor = AppColors.red.color.cgColor
      validationLabel.textColor = AppColors.red.color
      validationLabel.text = "Please enter a valid fullname"
    } else {
      presentCustomAlertOnMainThread(title: "Full Name Updated", message: "You have successfully updated \nyour full name", buttonTitle: "Done", imageNamed: "Medium-Profile", arrowBtn: false)
    }
  }
  @objc func didTapPersonalDetailsButton() {
    navigationController?.popViewController(animated: true)
  }
}
