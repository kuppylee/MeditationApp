//
//  PersonalDetailsMainViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit

class PersonalDetailsMainViewController: UIViewController, UIGestureRecognizerDelegate {
  // MARK: - TOP BACK ARROW BUTTON
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapBackToSettingsButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - PAGE TITLE LABEL
  let pageTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Personal Details"
    label.numberOfLines = 0
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - FULLNAME LABEL
  let fullnameLabel: UILabel = {
    let label = UILabel()
    label.text = "Full Name"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - EMAIL LABEL
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Email"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - PASSWORD LABEL
  let passwordLabel: UILabel = {
    let label = UILabel()
    label.text = "Password"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - FULLNAME UPDATE ICON
  let fullnameIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.smallUserIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapFullnameIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - EMAIL UPDATE ICON
  let emailIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.emailIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapEmailIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - PASSWORD UPDATE ICON
  let passwordIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.passwordIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapPasswordIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - FULLNAME FORWARD ICON
  let fullnameForwardButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardArrow.image, for: .normal)
    button.addTarget(self, action: #selector(didTapFullnameIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - EMAIL FORWARD ICON
  let emailForwardButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardArrow.image, for: .normal)
    button.addTarget(self, action: #selector(didTapEmailIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - PASSWORD FORWARD ICON
  let passwordForwardButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardArrow.image, for: .normal)
    button.addTarget(self, action: #selector(didTapPasswordIconButton), for: .touchUpInside)
    return button
  }()
  // MARK: - UPDATE FULLNAME VIEW
  let fullnameView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.white.color
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - UPDATE EMAIL VIEW
  let emailView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.white.color
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - UPDATE PASSWORD VIEW
  let passwordView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.white.color
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = AppColors.white.color
    setupSigninEmailScreenConstraint()
    setupConstraints()
    addGestureRecognizerFullnameView()
    addGestureRecognizerEmailView()
    addGestureRecognizerPasswordView()
    self.hideKeyboardWhenTappedAround()
  }
  @objc func didTapBackToSettingsButton() {
      navigationController?.popViewController(animated: true)
  }
  @objc func didTapFullnameIconButton() {
    let newViewController = FullnameUpdateViewController()
    navigationController?.pushViewController(newViewController, animated: true)
  }
  @objc func didTapEmailIconButton() {
    let newViewController = EmailUpdateViewController()
    navigationController?.pushViewController(newViewController, animated: true)
  }
  @objc func didTapPasswordIconButton() {
    let newViewController = PasswordChangeViewController()
    navigationController?.pushViewController(newViewController, animated: true)
  }
}
