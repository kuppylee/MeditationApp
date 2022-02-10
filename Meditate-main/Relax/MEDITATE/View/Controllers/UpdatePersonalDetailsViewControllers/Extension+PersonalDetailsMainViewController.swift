//
//  Extension+PersonalDetailsMainViewController.swift
//  MEDITATE
//
//  Created by Decagon on 13/10/2021.
//

import UIKit

extension PersonalDetailsMainViewController {
  // MARK: - ADD GESTURE RECOGNIZER TO FULLNAME UPDATE VIEW
  func addGestureRecognizerFullnameView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnFullnameView))
    tapGesture.delegate = self
    view.isUserInteractionEnabled = true
    fullnameView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnFullnameView(sender: UITapGestureRecognizer) {
    didTapFullnameIconButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO EMAIL UPDATE VIEW
  func addGestureRecognizerEmailView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnEmailView))
    tapGesture.delegate = self
    view.isUserInteractionEnabled = true
    emailView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnEmailView(sender: UITapGestureRecognizer) {
    didTapEmailIconButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO PASSWORD UPDATE VIEW
  func addGestureRecognizerPasswordView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnPasswordView))
    tapGesture.delegate = self
    view.isUserInteractionEnabled = true
    passwordView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnPasswordView(sender: UITapGestureRecognizer) {
    didTapPasswordIconButton()
  }
  func setupSigninEmailScreenConstraint() {
    view.addSubview(pageTitleLabel)
    view.addSubview(topBackArrowButton)
    fullnameView.addSubview(fullnameLabel)
    fullnameView.addSubview(fullnameForwardButton)
    fullnameView.addSubview(fullnameIcon)
    emailView.addSubview(emailIcon)
    emailView.addSubview(emailLabel)
    emailView.addSubview(emailForwardButton)
    passwordView.addSubview(passwordIcon)
    passwordView.addSubview(passwordLabel)
    passwordView.addSubview(passwordForwardButton)
    view.addSubview(fullnameView)
    view.addSubview(emailView)
    view.addSubview(passwordView)
  }
  func setupConstraints() {
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
      fullnameView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 40),
      fullnameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      fullnameView.heightAnchor.constraint(equalToConstant: 50),
      fullnameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      emailView.topAnchor.constraint(equalTo: fullnameView.bottomAnchor, constant: 35),
      emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      emailView.heightAnchor.constraint(equalToConstant: 50),
      emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 35),
      passwordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      passwordView.heightAnchor.constraint(equalToConstant: 50),
      passwordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      fullnameIcon.topAnchor.constraint(equalTo: fullnameView.topAnchor, constant: 2),
      fullnameIcon.leadingAnchor.constraint(equalTo: fullnameView.leadingAnchor, constant: 10),
      emailIcon.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 2),
      emailIcon.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
      passwordIcon.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 2),
      passwordIcon.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
      fullnameLabel.topAnchor.constraint(equalTo: fullnameView.topAnchor, constant: 15),
      fullnameLabel.leadingAnchor.constraint(equalTo: fullnameIcon.leadingAnchor, constant: 75),
      emailLabel.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 15),
      emailLabel.leadingAnchor.constraint(equalTo: emailIcon.leadingAnchor, constant: 75),
      passwordLabel.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 15),
      passwordLabel.leadingAnchor.constraint(equalTo: passwordIcon.leadingAnchor, constant: 75),
      fullnameForwardButton.topAnchor.constraint(equalTo: fullnameView.topAnchor, constant: 10),
      fullnameForwardButton.trailingAnchor.constraint(equalTo: fullnameView.trailingAnchor, constant: -10),
      emailForwardButton.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 10),
      emailForwardButton.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -10),
      passwordForwardButton.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 10),
      passwordForwardButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -10)
    ])
  }
}
