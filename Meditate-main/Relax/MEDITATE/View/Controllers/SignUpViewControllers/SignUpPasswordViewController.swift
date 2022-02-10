//
//  SignUpPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 25/09/2021.
//

import UIKit

class SignUpPasswordViewController: UIViewController {
    var email: String = ""
    // MARK: - ... Creating the button to go to the account creation screen
    lazy var continueToAccountCreation: UIButton = {
        let goForwardImage: UIImageView = {
            let image = UIImageView(image: AppButtonImages.goForwardButton.image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.widthAnchor.constraint(equalToConstant: 28).isActive = true
            image.heightAnchor.constraint(equalToConstant: 28).isActive = true
            return image
        }()
        let button = UIButton.makeBlackAndRounded()
        button.setTitle("Create Account", for: .normal)
        button.isEnabled = false
        button.addSubview(goForwardImage)
        goForwardImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
        goForwardImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        return button
    }()
    // MARK: - ... Creating the back button to the email creation screen)
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppButtonImages.goBackButton.image, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.addTarget(self, action: #selector(goToEmailCreationScreen), for: .touchUpInside)
        return button
    }()
    // MARK: - ... Method to go back to the email creation screen
    @objc func goToEmailCreationScreen() {
        navigationController?.popViewController(animated: true)
    }
    // MARK: - ... Creating the header to display email creation
    lazy var enterPasswordHeader: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Please create a \npassword"
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 22)
        label.numberOfLines = 2
        return label
    }()
    // MARK: - ... Creating the toggle button to switch password hidden
    lazy var toggleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.setImage(AppButtonImages.openFocus.image, for: .normal)
        button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        return button
    }()
    // MARK: - ... Creating the method to set secured text and it's button image
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
    // MARK: - ... Creating the password text field where text will be entered
    var passwordTextField: UITextField = {
        let textField = UITextField.makePaddedAndBordered()
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(validateViews(_:)), for: .editingChanged)
        return textField
    }()
    // MARK: - ... Creating the "Password" text on top of the text field
    lazy var passwordLabel: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Password"
        return label
    }()
    // MARK: - ... Creating the password description at the bottom of the text field
    lazy var passwordDescriptionLabel: UILabel = {
        let label = UILabel.useFontAndResize()
        label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
        return label
    }()
    // MARK: - ... Creating the Validation progress bar
    lazy var passwordStrengthBar: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = AppColors.gray.color
        return progressView
    }()
    // MARK: - ... Creating the Validation field for six characters
    lazy var sixCharacterValidation: UITextField = {
        let textField = UITextField.makeValidationField()
        textField.text = "6 Characters"
        return textField
    }()
    // MARK: - ... Creating the Validation field for at least one character
    lazy var oneUpperCaseValidation: UITextField = {
        let textField = UITextField.makeValidationField()
        textField.text = "1 Uppercase letter "
        return textField
    }()
    // MARK: - ... Creating the top stackview
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
    // MARK: - ... Creating the Validation field for at least one number
    lazy var oneNumberValidation: UITextField = {
        let textField = UITextField.makeValidationField()
        textField.text = "1 Number"
        return textField
    }()
    // MARK: - ... Creating the Validation field for at least one special character
    lazy var oneSpecialCharacterValidation: UITextField = {
        let textField = UITextField.makeValidationField()
        textField.text = "1 Special character"
        return textField
    }()
    // MARK: - ... Creating the bottom stackview
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
    // MARK: - ... ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupConstraints()
        self.hideKeyboardWhenTappedAround()
    }
    // MARK: - ... Validating the views if password text change
    @objc func validateViews(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.validateSixCharacters()
            self.validateUppercaseLetter()
            self.validateNumber()
            self.validateSpecialCharacter()
            self.validateAllOtherFields()
            self.validateAccountCreationButton()
            self.validateStrengthBar()
        }
    }
}
