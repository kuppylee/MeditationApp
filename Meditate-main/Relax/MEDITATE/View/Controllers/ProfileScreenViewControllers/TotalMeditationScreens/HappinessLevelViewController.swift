//
//  HappinessLevelViewController.swift
//  MEDITATE
//
//  Created by Decagon on 03/10/2021.
//

import UIKit

class HappinessLevelViewController: UIViewController {
  // MARK: - TOP BACK ARROW BUTTON
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - INCREASE HAPPINESS LEVEL ICON
  let increaseHappinessLevelIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.increaseHappiness.image, for: .normal)
    button.addTarget(self, action: #selector(didTapdecreaseStressForwardArrowButton), for: .touchUpInside)
    return button
  }()
  // MARK: - HAPPINESS LABEL
  let happinessLabel: UILabel = {
    let label = UILabel()
    label.text = "Happiness Level"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - DECREASE STRESS LEVEL LABEL
  let decreaseStressLevelLabel: UILabel = {
    let label = UILabel()
    label.text = "Your happiness level has \nincreased by 78 % recently"
    label.numberOfLines = 2
    label.textAlignment = .center
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - SHARE BUTTON
  let shareButton: UIButton = {
    let button = UIButton(type: .system)
    button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Share", for: .normal)
    button.setTitleColor(AppColors.white.color, for: .normal)
    button.layer.cornerRadius = 24
    button.backgroundColor = AppColors.black.color
    button.titleLabel?.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 17)
    button.isEnabled = true
    return button
  }()
  // MARK: - SHARE FORWARD ARROW BUTTON
  let shareForwardArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapShareButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goForwardButton.image, for: .normal)
    return button
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    setupConstraintsHappinessLevelVC()
  }
  // MARK: - SETUP VIEWS FUNCTION
  func setupViewsHappinessLevelVC() {
    view.addSubview(increaseHappinessLevelIcon)
    view.addSubview(decreaseStressLevelLabel)
    view.addSubview(shareButton)
    view.addSubview(happinessLabel)
    view.addSubview(shareForwardArrowButton)
    view.addSubview(topBackArrowButton)
  }
  // MARK: - SETUP CONTRAINTS FUNCTION
  func setupConstraintsHappinessLevelVC() {
    setupViewsHappinessLevelVC()
    NSLayoutConstraint.activate([
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      increaseHappinessLevelIcon.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -27),
      increaseHappinessLevelIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      increaseHappinessLevelIcon.heightAnchor.constraint(equalToConstant: 116),
      increaseHappinessLevelIcon.widthAnchor.constraint(equalToConstant: 116),
      decreaseStressLevelLabel.topAnchor.constraint(equalTo: happinessLabel.bottomAnchor, constant: 20),
      decreaseStressLevelLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      happinessLabel.topAnchor.constraint(equalTo: increaseHappinessLevelIcon.bottomAnchor, constant: 50),
      happinessLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
      shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      shareButton.heightAnchor.constraint(equalToConstant: 55),
      shareForwardArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -63),
      shareForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
    ])
  }
  // MARK: - DID TAP SHARE BUTTON FUNCTION
  @objc func didTapShareButton() {
    presentCustomAlertOnMainThread(title: "Share with Friends", message: "You can share all your \nachievements with your friends", buttonTitle: "Share", imageNamed: "Share-Icon", arrowBtn: true)
  }
  // MARK: - DID TAP DECREASE STRESS FORWARD ARROW BUTTON FUNCTION
  @objc func  didTapdecreaseStressForwardArrowButton() {
    let newController = StressLevelViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP TOP BACK ARROW BUTTON FUNCTION
  @objc func didTapTopBackArrowButton() {
    navigationController?.popViewController(animated: true)
  }
}
