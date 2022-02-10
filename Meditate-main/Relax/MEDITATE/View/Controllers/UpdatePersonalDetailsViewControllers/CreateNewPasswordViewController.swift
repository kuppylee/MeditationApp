//
//  CreateNewPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 12/10/2021.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
  var email: String = ""
  // MARK: - GO FORWARD BUTTON
  lazy var continueToAccountCreation: UIButton = {
    let goForwardImage: UIImageView = {
      let image = UIImageView(image: AppButtonImages.goForwardButton.image)
      image.translatesAutoresizingMaskIntoConstraints = false
      image.contentMode = .scaleAspectFit
      image.widthAnchor.constraint(equalToConstant: 28).isActive = true
      image.heightAnchor.constraint(equalToConstant: 28).isActive = true
      return image
    }()
    // MARK: - UPDATE PASSWORD BUTTON
    let button = UIButton.makeBlackAndRounded()
    button.setTitle("Update Password", for: .normal)
    button.isEnabled = false
    button.addSubview(goForwardImage)
    goForwardImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
    goForwardImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
    button.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
    return button
  }()
  // MARK: - GO BACK TO PREVIOUS SCREEN WHEN BUTTON IS CLICKED
  lazy var backButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    button.widthAnchor.constraint(equalToConstant: 28).isActive = true
    button.heightAnchor.constraint(equalToConstant: 28).isActive = true
    button.addTarget(self, action: #selector(goToCurrentPasswordScreen), for: .touchUpInside)
    return button
  }()
  // MARK: - SENDS YOU BACK TO PREVIOUS SCREEN
  @objc func goToCurrentPasswordScreen() {
    navigationController?.popViewController(animated: true)
  }
  // MARK: - PAGE DESCRIPTION LABEL
  lazy var enterPasswordHeader: UILabel = {
    let label = UILabel.useFontAndResize()
    label.text = "Please create a \npassword"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 22)
    label.numberOfLines = 2
    return label
  }()
  // MARK: - TOGGLE BUTTON FOR PASSWORD VISIBILITY
  lazy var toggleButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 28).isActive = true
    button.widthAnchor.constraint(equalToConstant: 28).isActive = true
    button.setImage(AppButtonImages.openFocus.image, for: .normal)
    button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
    return button
  }()
  // MARK: - FUNCTION FOR TOGGLE BUTTON IMPLEMENTATION
  @objc func togglePassword(_ UIButton: UIButton) {
    UIButton.isSelected = !UIButton.isSelected
    if UIButton.isSelected {
      passwordTextField.isSecureTextEntry = false
      toggleButton.setImage(AppButtonImages.closedFocus.image, for: .normal)
    } else {
      passwordTextField.isSecureTextEntry = true
      toggleButton.setImage(AppButtonImages.openFocus.image, for: .normal)
    }
  }
  // MARK: - PASSWORD TEXTFIELD TO COLLECT USER INPUT
  var passwordTextField: UITextField = {
    let textField = UITextField.makePaddedAndBordered()
    textField.isSecureTextEntry = true
    textField.addTarget(self, action: #selector(validateViews(_:)), for: .editingChanged)
    return textField
  }()
  // MARK: - PASSWORD TEXT LABEL
  lazy var passwordLabel: UILabel = {
    let label = UILabel.useFontAndResize()
    label.text = "Password"
    return label
  }()
  // MARK: - PASSWORD VALIDATION DESCRIPTION LABEL
  lazy var passwordDescriptionLabel: UILabel = {
    let label = UILabel.useFontAndResize()
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
    return label
  }()
  // MARK: - PASSWORD VALIDATION PROGRESS BAR TO SHOW PASSWORD STRENGTH
  lazy var passwordStrengthBar: UIProgressView = {
    let progressView = UIProgressView()
    progressView.translatesAutoresizingMaskIntoConstraints = false
    progressView.trackTintColor = AppColors.gray.color
    return progressView
  }()
  // MARK: - VALIDATION FIELD FOR SIX CHARACTER
  lazy var sixCharacterValidation: UITextField = {
    let textField = UITextField.makeValidationField()
    textField.text = "6 Characters"
    return textField
  }()
  // MARK: - VALIDATION FIELD FOR ATLEAST ONE UPPERCASE LETTER
  lazy var oneUpperCaseValidation: UITextField = {
    let textField = UITextField.makeValidationField()
    textField.text = "1 Uppercase letter "
    return textField
  }()
  // MARK: - TOP STACK VIEW
  lazy var topStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(sixCharacterValidation)
    stackView.addArrangedSubview(oneUpperCaseValidation)
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 15
    return stackView
  }()
  // MARK: - VALIDATION FOR ATLEAST ONE NUMBER INPUT
  lazy var oneNumberValidation: UITextField = {
    let textField = UITextField.makeValidationField()
    textField.text = "1 Number"
    return textField
  }()
  // MARK: - VALIDATION FOR ATLEAST ONE SPECIAL CHARACTER INPUT
  lazy var oneSpecialCharacterValidation: UITextField = {
    let textField = UITextField.makeValidationField()
    textField.text = "1 Special character"
    return textField
  }()
  // MARK: - BOTTOM STACK VIEW
  lazy var bottomStack: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.addArrangedSubview(oneNumberValidation)
    stackView.addArrangedSubview(oneSpecialCharacterValidation)
    stackView.axis = .horizontal
    stackView.distribution = .fillProportionally
    stackView.spacing = 15
    return stackView
  }()
  // MARK: - VIEWDIDLOAD
  override func viewDidLoad() {
    super.viewDidLoad()
    addViews()
    setupConstraints()
    setDecriptionToHidden()
    self.hideKeyboardWhenTappedAround()
  }
  // MARK: - FUNCTION TO HIDE DESCRIPTION AND VALIDATION TEXTFIELDS AS PAGE LOADS
  func setDecriptionToHidden() {
    if passwordTextField.text == "" {
      passwordDescriptionLabel.isHidden = true
      passwordStrengthBar.isHidden = true
      topStack.isHidden = true
      bottomStack.isHidden = true
    }
  }
  // MARK: - PAGE VALIDATION FUNCTION
  @objc func validateViews(_ textField: UITextField) {
    if passwordTextField.text != "" {
      passwordDescriptionLabel.isHidden = false
      passwordStrengthBar.isHidden = false
      topStack.isHidden = false
      bottomStack.isHidden = false
    }
    validateSixCharacters()
    validateSpecialCharacter()
    validateUppercaseLetter()
    validateNumber()
    validateAllOtherFields()
    validateStrengthBar()
    validateAccountCreationButton()
  }
}
