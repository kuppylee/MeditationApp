//
//  LongestSessionViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class LongestSessionViewController: UIViewController, UIGestureRecognizerDelegate {
  // MARK: - TOP BACK ARROW BUTTON
  let topBackArrowButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
    return button
  }()
  // MARK: - PAGE TITLE LABEL
  let pageTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Longest Session"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION VIEW
  let longestSessionView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - LONGEST SESSION ICON
  let longestSessionIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.longestSessionIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapStressDecreaseButton), for: .touchUpInside)
    return button
  }()
  // MARK: - LONGEST SESSION TIME LABEL
  let longestSessionTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "35 minutes"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION TEXT LABEL
  let longestSessionTextLabel: UILabel = {
    let label = UILabel()
    label.text = "You longest meditation so \nfar since you have started"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION SECOND VIEW
  let longestSessionSecondView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - LONGEST SESSION SECOND ICON
  let longestSessionSecondIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.longestSessionIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapFocusMastersButton), for: .touchUpInside)
    return button
  }()
  // MARK: - LONGEST SESSION SECOND TIME LABEL
  let longestSessionSecondTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "32 minutes"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION SECOND TEXT LABEL
  let longestSessionSecondTextLabel: UILabel = {
    let label = UILabel()
    label.text = "You second longest meditation \nsession so far"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION SECOND VIEW
  let longestSessionThirdView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - LONGEST SESSION THIRD ICON
  let longestSessionThirdIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.longestSessionIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapConsistentScheduleButton), for: .touchUpInside)
    return button
  }()
  // MARK: - LONGEST SESSION THIRD TIME LABEL
  let longestSessionThirdTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "27 minutes"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION THIRD TEXT LABEL
  let longestSessionThirdTextLabel: UILabel = {
    let label = UILabel()
    label.text = "You third longest meditation \nsession so far"
    label.numberOfLines = 2
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
    setupViewConstraints()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    addGestureRecognizerLongestSessionView()
    addGestureRecognizerLongestSessionSecondView()
    addGestureRecognizerLongestSessionThirdView()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO FIRST LONGEST SESSION VIEW
  func addGestureRecognizerLongestSessionView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnLongestSessionView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      longestSessionView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnLongestSessionView(sender: UITapGestureRecognizer) {
    didTapStressDecreaseButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO SECOND LONGEST SESSION VIEW
  func addGestureRecognizerLongestSessionSecondView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnLongestSessionSecondView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      longestSessionSecondView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnLongestSessionSecondView(sender: UITapGestureRecognizer) {
    didTapFocusMastersButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO THIRD LONGEST SESSION VIEW
  func addGestureRecognizerLongestSessionThirdView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnLongestSessionThirdView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      longestSessionThirdView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnLongestSessionThirdView(sender: UITapGestureRecognizer) {
    didTapConsistentScheduleButton()
  }
  // MARK: - DID TAP TOP BACK ARROW BUTTON FUNCTION
  @objc func didTapTopBackArrowButton() {
    if let tabBarController = TabBarViewController() as? UITabBarController {
            tabBarController.selectedIndex = 2
      navigationController?.popViewController(animated: true)
        }
  }
  // MARK: - DID TAP STRESS DECREASE BUTTON FUNCTION
  @objc func didTapStressDecreaseButton() {
    let newController = StressDecreaseViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP FOCUS MASTER BUTTON FUNCTION
  @objc func didTapFocusMastersButton() {
    let newController = FocusMastersViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP CONSISTENT SCHEDULE BUTTON FUNCTION
  @objc func didTapConsistentScheduleButton() {
    let newController = ConsistentScheduleViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP SHARE BUTTON FUNCTION
  @objc func didTapShareButton() {
    presentCustomAlertOnMainThread(title: "Share with Friends", message: "You can share all your \nachievements with your friends", buttonTitle: "Share", imageNamed: "Share-Icon", arrowBtn: false)
  }
}
