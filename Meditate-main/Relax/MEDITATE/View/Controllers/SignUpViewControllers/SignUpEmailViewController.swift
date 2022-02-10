//
//  SignUpEmailViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 24/09/2021.
//

import UIKit

class SignUpEmailViewController: UIViewController {
    // MARK: - ... Creating the button to go to the password creation screen
    lazy var continueToPasswordCreation: UIButton = {
        let goForwardImage: UIImageView = {
            let image = UIImageView(image: AppButtonImages.goForwardButton.image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFit
            image.widthAnchor.constraint(equalToConstant: 28).isActive = true
            image.heightAnchor.constraint(equalToConstant: 28).isActive = true
            return image
        }()
        let button = UIButton.makeBlackAndRounded()
        button.setTitle("Continue", for: .normal)
        button.addSubview(goForwardImage)
        button.isEnabled = false
        goForwardImage.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20).isActive = true
        goForwardImage.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        return button
    }()
    // MARK: - ... Creating the email text field where text will be entered
    lazy var emailTextField: UITextField = {
        let textField = UITextField.makePaddedAndBordered()
        textField.autocapitalizationType = .none
        textField.placeholder = "johnsmith@gmail.com"
        textField.addTarget(self, action: #selector(validateViews(_:)), for: .editingChanged)
        return textField
    }()
    // MARK: - ... Creating the "email" text on top of the text field
    lazy var emailLabel: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Email"
        return label
    }()
    // MARK: - ... Creating the label to change according to the entered email on the email field
    lazy var emailVerificationLabel: UILabel = {
        let label = UILabel.useFontAndResize()
        label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 13)
        return label
    }()
    // MARK: - ... Creating the header to display email creation
    lazy var enterEmailHeader: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Please enter your \nemail address"
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 22)
        label.numberOfLines = 2
        return label
    }()
    // MARK: - ... Creating the back button(to the on-boarding screen)
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppButtonImages.goBackButton.image, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        return button
    }()
  let authenticationLabel: UILabel = {
    let label = UILabel()
    label.text = "Already have an account?"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 12)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  let signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Sign In", for: .normal)
    button.setTitleColor(AppColors.black.color, for: .normal)
    button.backgroundColor = AppColors.white.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 12)
    button.isEnabled = true
    return button
  }()
    // MARK: - ... ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupViewConstraints()
        self.hideKeyboardWhenTappedAround()
    }
    // MARK: - ... Validation of views on the email text field
    @objc func validateViews(_ textField: UITextField) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.validateEmail()
            self.validatePasswordCreationButton()
        }
    }
    // MARK: - ... Validation of email format
    func validateEmail() {
        guard let text = emailTextField.text else { return }
        let nameText = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverText = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = nameText + "@" + serverText + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let emailResult = emailPredicate.evaluate(with: text)
        if emailResult == true {
            emailVerificationLabel.text = "Correct email"
            emailVerificationLabel.textColor = AppColors.green.color
            emailTextField.layer.borderColor = AppColors.green.color.cgColor
        } else {
            emailVerificationLabel.text = "Please enter a valid email"
            emailVerificationLabel.textColor = AppColors.red.color
            emailTextField.layer.borderColor = AppColors.red.color.cgColor
        }
    }
    // MARK: - ... Validation of email to go to password creation
    func validatePasswordCreationButton() {
        if emailVerificationLabel.textColor == AppColors.green.color {
            continueToPasswordCreation.addTarget(self, action: #selector(goToPasswordCreationScreen), for: .touchUpInside)
            continueToPasswordCreation.backgroundColor = AppColors.black.color
            continueToPasswordCreation.isEnabled = true
        } else {
            continueToPasswordCreation.isEnabled = false
            continueToPasswordCreation.backgroundColor = AppColors.grayedOutButton.color
        }
    }
    // MARK: - ... Method to go to the password creation screen
    @objc func goToPasswordCreationScreen() {
        let signUpPasswordViewController = SignUpPasswordViewController()
        signUpPasswordViewController.email = emailTextField.text!
        navigationController?.pushViewController(signUpPasswordViewController, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
  @objc func didTapSignUpButton() {
    let newController = SignInEmailViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
    // MARK: - ... Adding views to the view controller
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(continueToPasswordCreation)
        view.addSubview(emailTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailVerificationLabel)
        view.addSubview(enterEmailHeader)
        view.addSubview(backButton)
        view.addSubview(authenticationLabel)
        view.addSubview(signInButton)
    }
    // MARK: - ... Setting up constraints on added views
    func setupViewConstraints() {
        NSLayoutConstraint.activate([
            continueToPasswordCreation.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueToPasswordCreation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            continueToPasswordCreation.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            continueToPasswordCreation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -10),
            emailLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            emailVerificationLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 5),
            emailVerificationLabel.leftAnchor.constraint(equalTo: emailTextField.leftAnchor),
            enterEmailHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterEmailHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            authenticationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            authenticationLabel.bottomAnchor.constraint(equalTo: continueToPasswordCreation.bottomAnchor, constant: 25),
            signInButton.leadingAnchor.constraint(equalTo: authenticationLabel.trailingAnchor, constant: 4),
            signInButton.bottomAnchor.constraint(equalTo: continueToPasswordCreation.bottomAnchor, constant: 30)
        ])
    }
}
