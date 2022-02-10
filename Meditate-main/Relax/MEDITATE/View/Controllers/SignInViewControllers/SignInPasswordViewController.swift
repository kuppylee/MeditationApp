//
//  SignInPasswordViewController.swift
//  MEDITATE
//
//  Created by Decagon on 26/09/2021.
//

import UIKit
import FirebaseAuth

class SignInPasswordViewController: UIViewController, CustomProtocol {
    var email: String = ""
    let instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter your \n password"
        label.font = UIFont(name: "Helvetica", size: 18)
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Helvetica", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let validationLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = UIFont(name: "Helvetica", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let passwordTextField: LeftPaddedTextField = {
        let textField = LeftPaddedTextField()
        textField.layer.borderColor = UIColor.black.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.layer.cornerRadius = 24
        return textField
    }()
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 24
        return button
    }()
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(didTapForgotPasswordButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 24
        return button
    }()
    let topBackArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Go Back Icon"), for: .normal)
        return button
    }()
    let signInForwardArrowButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Go-forward"), for: .normal)
        return button
    }()
    let signInVisibilityButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapPasswordVisibilityButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "Focus Icon"), for: .normal)
        return button
    }()
    let signInVisibilityNoFocusButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapVisibilityNoFocusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "No-focus"), for: .normal)
        button.isHidden = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSigninPasswordSreenConstraint()
        self.hideKeyboardWhenTappedAround()
    }
    // MARK: - Function to sign in
    @objc func didTapSignInButton() {
        if passwordTextField.text == "" {
            validationLabel.text = "Incorrect password"
            validationLabel.textColor = .red
            passwordTextField.layer.borderColor = UIColor.red.cgColor
        } else {
            signInButton.isEnabled = true
            signInToFirebase()
        }
    }
    // MARK: - ... Signing in to an account in firebase
    func signInToFirebase() {
        let password = passwordTextField.text!
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
            guard let self = self else { return }
            if error != nil {
                return
            } else {
                self.navigationController?.pushViewController(TabBarViewController(), animated: true)
                UserDefaults.standard.setValue(true, forKey: Defaults.signedIn.key)
            }
        }
    }
    @objc func didTapPasswordVisibilityButton() {
        passwordTextField.isSecureTextEntry = false
        signInVisibilityNoFocusButton.isHidden = false
    }
    @objc func didTapVisibilityNoFocusButton() {
        passwordTextField.isSecureTextEntry = true
        signInVisibilityNoFocusButton.isHidden = true
        signInVisibilityButton.isHidden = false
    }
    @objc func didTapForgotPasswordButton() {
        CustomAlertView.shared.delegate = self
        CustomAlertView.shared.showCustomAlert(title: "Reset Password", message: "We will email you a magic link to reset your password.")
    }
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> Void)? = nil) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    func didTapActionBtn(view: UIView) {
        view.removeFromSuperview()
    }
    func didTapSendLink(view: UIView) {    view.removeFromSuperview()
        //  segue to next view controller
        sendPasswordReset(withEmail: email)
        //  segue to next view controller
        let passwordResetScreen = PasswordResetViewController()
        passwordResetScreen.modalPresentationStyle = .fullScreen
        present(passwordResetScreen, animated: true, completion: nil)
        print(view)
    }
    @objc func didTapOnboardingButton() {
    }
    @objc func didTapTopBackArrowButton() {
    }

}
