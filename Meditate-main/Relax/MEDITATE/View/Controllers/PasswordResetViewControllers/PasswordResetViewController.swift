//
//  PasswordResetViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//
import UIKit
import FirebaseAuth

class PasswordResetViewController: UIViewController {
  // MARK: - Heading Label
  let instructionHeadingTextLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Confirm your new \n password"
      label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.numberOfLines = 2
    return label
  }()
  // MARK: - Button to go back
  let backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    return button
  }()
  // MARK: - Label for password
  let passwordLabel: UILabel = {
    let label = UILabel.useFontAndResize()
    label.text = "Password"
    return label
  }()
  // MARK: - Textfield to enter password
  let passwordTextField: UITextField = {
    let textField = UITextField.makePaddedAndBordered()
    textField.isSecureTextEntry = true
    textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged )
    return textField
  }()
  // MARK: - Button to show password
  let showPasswordButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.openFocus.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(buttonPasswordVisibiltyClicked), for: .touchUpInside)
    return button
  }()
  // MARK: - Validation Label to show password strength des
  lazy var passwordStrengthDescriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "Weak password"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - Progress bar
  lazy var passwordStrengthProgressBar: UIProgressView = {
    let progressView = UIProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.trackTintColor = .lightGray
    progressView.tintColor = .red
    progressView.setProgress(0.079, animated: true)
    return progressView
  }()
  // MARK: - Validation for upper case
  lazy var oneUpperCaseValidation: UITextField = {
    let textField = UITextField.toMakeValidationField()
    textField.text = " 1 Uppercase letter"
    return  textField
  }()
  // MARK: - Validation for six character
  lazy var sixCharacterValidation: UITextField = {
    let textField = UITextField.toMakeValidationField()
    textField.text = " 6 Characters "
    return textField
  }()
  // MARK: - Validation for number
  lazy var oneNumberValidation: UITextField = {
    let textField = UITextField.toMakeValidationField()
    textField.text = " 1 Number"
    return  textField
  }()
  // MARK: - Validation for special character
  lazy var oneSpecialCharacterValidation: UITextField = {
    let textField = UITextField.toMakeValidationField()
    textField.text = " 1 Special character "
    return textField
  }()
  // MARK: - Stack
  lazy var uppercaseAndCharacterCountStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(sixCharacterValidation)
    stackView.addArrangedSubview(oneUpperCaseValidation)
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 15
    return stackView
  }()
  // MARK: - Stack
  lazy var numberAndSpecialCharacterStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(oneNumberValidation)
    stackView.addArrangedSubview(oneSpecialCharacterValidation)
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 15
    return stackView
  }()
  // MARK: - Button
  let forwardButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.goForwardButton.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    return button
  }()
  // MARK: - Button
  let resetPasswordButton: UIButton = {
    let resetPassword = UIButton(type: .custom)
    resetPassword.translatesAutoresizingMaskIntoConstraints = false
    resetPassword.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    resetPassword.layer.cornerRadius = 25
    resetPassword.backgroundColor = AppColors.black.color
    resetPassword.setTitle("Reset Password", for: .normal)
    resetPassword.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    return resetPassword
  }()
  // MARK: - Function
  @objc func buttonPasswordVisibiltyClicked(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    if sender.isSelected {
      passwordTextField.isSecureTextEntry = false
      showPasswordButton.setImage(AppButtonImages.closedFocus.image, for: .normal)
    } else {
      passwordTextField.isSecureTextEntry = true
      showPasswordButton.setImage(AppButtonImages.openFocus.image, for: .normal)
    }
  }
  // MARK: - Function
  override func viewDidLoad() {
    super.viewDidLoad()
    constraintViews()
    self.hideKeyboardWhenTappedAround()
    if passwordTextField.text == "" {
      setDecriptionToHidden()
    }
  }
}
