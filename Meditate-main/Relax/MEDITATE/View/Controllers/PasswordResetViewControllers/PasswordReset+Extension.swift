//
//  PasswordReset+Extension.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 01/10/2021.
//

import UIKit

extension PasswordResetViewController {
    // MARK: - Function
    func validateSixCharacters() {
      let text = passwordTextField.text
      if (text!.count > 5) == true {
        sixCharacterValidation.textColor = AppColors.green.color
        sixCharacterValidation.layer.borderColor = AppColors.green.color.cgColor
      } else {
        sixCharacterValidation.textColor = AppColors.red.color
        sixCharacterValidation.layer.borderColor = AppColors.red.color.cgColor
      }
    }
    // MARK: - Function
    func validateUppercaseLetter() {
      let text = passwordTextField.text
      let capitalLetterRegEx  = ".*[A-Z]+.*"
      let textTest = NSPredicate(format: "SELF MATCHES %@", capitalLetterRegEx)
      let upperCaseResult = textTest.evaluate(with: text)
      if upperCaseResult {
        oneUpperCaseValidation.textColor = AppColors.green.color
        oneUpperCaseValidation.layer.borderColor = AppColors.green.color.cgColor
      } else {
        oneUpperCaseValidation.textColor = AppColors.red.color
        oneUpperCaseValidation.layer.borderColor = AppColors.red.color.cgColor
      }
    }
    // MARK: - Function
    func validateNumber() {
      let text = passwordTextField.text
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
    // MARK: - Function
    func validateSpecialCharacter() {
      let text = passwordTextField.text
      let specialCharacterRegEx  = ".*[!&^%$#@()*/]+.*"
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
    func validateAllOtherFields() {
      if sixCharacterValidation.textColor == AppColors.green.color &&
          oneUpperCaseValidation.textColor == AppColors.green.color &&
          oneNumberValidation.textColor == AppColors.green.color &&
          oneSpecialCharacterValidation.textColor == AppColors.green.color {
        passwordTextField.layer.borderColor = AppColors.green.color.cgColor
        passwordStrengthDescriptionLabel.text = "Strong password"
        passwordStrengthDescriptionLabel.textColor = AppColors.green.color
        passwordStrengthProgressBar.tintColor = AppColors.green.color
        passwordStrengthProgressBar.setProgress(1, animated: true)
        resetPasswordButton.backgroundColor = AppColors.black.color
        resetPasswordButton.isEnabled = true
      } else {
        passwordTextField.layer.borderColor = AppColors.red.color.cgColor
        passwordStrengthDescriptionLabel.text = "Weak password"
        passwordStrengthDescriptionLabel.textColor = AppColors.red.color
        passwordStrengthProgressBar.tintColor = AppColors.red.color
        passwordStrengthProgressBar.setProgress(0.19, animated: true)
        resetPasswordButton.backgroundColor = AppColors.grayedOutButton.color
        resetPasswordButton.isEnabled = false
      }
    }
    func toValidatePasswordStrengthBar() {
              guard let text = passwordTextField.text else { return }
              var strength: Float = 0.00
      if sixCharacterValidation.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneUpperCaseValidation.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneNumberValidation.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if oneSpecialCharacterValidation.textColor == AppColors.green.color {
                  strength += 0.20
              }
              if strength >= 0.80 && text.count >= 9 {
                  strength = 1.000
              }
            passwordStrengthProgressBar.setProgress(strength, animated: true)
              if strength >= 0.80 {
                passwordStrengthProgressBar.tintColor = AppColors.green.color
                resetPasswordButton.isEnabled = true
                resetPasswordButton.backgroundColor = AppColors.black.color
              } else {
                passwordStrengthProgressBar.tintColor = AppColors.red.color
                resetPasswordButton.isEnabled = false
                resetPasswordButton.backgroundColor = AppColors.grayedOutButton.color
              }
          }
    // MARK: - Function to set password description label to hidden
    func setDecriptionToHidden() {
      passwordStrengthDescriptionLabel.isHidden = true
      passwordStrengthProgressBar.isHidden = true
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
      if passwordTextField.text != "" {
        passwordStrengthDescriptionLabel.isHidden = false
        passwordStrengthProgressBar.isHidden = false
      }
      validateSixCharacters()
      validateSpecialCharacter()
      validateUppercaseLetter()
      validateNumber()
      validateAllOtherFields()
      toValidatePasswordStrengthBar()
    }
    // MARK: - Function text
    @objc func  backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
}
// MARK: - ... Extension
extension UITextField {
 class func makeTextField() -> UITextField {
   let textField = UITextField()
   textField.translatesAutoresizingMaskIntoConstraints = false
   textField.layer.cornerRadius = 27.5
   textField.heightAnchor.constraint(equalToConstant: 55).isActive = true
   textField.layer.borderWidth = 1
   return textField
 }
 class func toMakeValidationField() -> UITextField {
   let textField = UITextField()
   textField.translatesAutoresizingMaskIntoConstraints = false
   textField.isUserInteractionEnabled = false
   textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
   textField.textAlignment = .center
   textField.layer.cornerRadius = 25
   textField.font = UIFont(name: "NunitoSans-Regular", size: 13)
   textField.layer.borderWidth = 1
   return textField
 }
 func setPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
   if let left = left {
     let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.size.height))
     self.leftView = paddingView
     self.leftViewMode = .always
   }
   if let right = right {
     let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.size.height))
     self.rightView = paddingView
     self.rightViewMode = .always
   }
 }
}
