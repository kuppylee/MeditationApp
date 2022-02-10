//
//  ProfilePageViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class ProfilePageViewController: UIViewController, UIScrollViewAccessibilityDelegate, UIGestureRecognizerDelegate {
  // MARK: - SCROLL VIEW AND CONTENT VIEW SETUP
  let contentView: UIView = {
  let content = UIView()
      content.translatesAutoresizingMaskIntoConstraints = false
    return content
  }()
  let scrollView: UIScrollView = {
  let scroll = UIScrollView()
    scroll.showsHorizontalScrollIndicator = false
    scroll.translatesAutoresizingMaskIntoConstraints = false
    return scroll
  }()
  // MARK: - PAGE TITLE
  let profileLabel: UILabel = {
    let label = UILabel()
    label.text = "Profile"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - SETTINGS BUTTON
  let topSettingsButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
    button.setBackgroundImage(AppButtonImages.settings.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
   return button
  }()
  // MARK: - USER PROFILE IMAGE
  let userProfileButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.mediumProfile.image, for: .normal)
      button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
      return button
  }()
  // MARK: - STROKE AROUND USER PROFILE IMAGE
  let userStrokeButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setImage(AppButtonImages.stroke.image, for: .normal)
      button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
      return button
  }()
  // MARK: - USERNAME LABEL
  let usernameLabel: UILabel = {
    let label = UILabel()
    label.text = "John Smith"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 18)
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - USER EMAIL LABEL
  let userEmailLabel: UILabel = {
    let label = UILabel()
    label.text = "johnsmith@gmail.com"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 14)
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TARGET VIEW
  let targetView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TARGET ACHIEVED TITLE LABEL
  let targetAchievedTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Target Achieved"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 18)
    label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TARGET ACHIEVED BODY TEXT LABEL
  let targetAchievedBodyTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Learn more about everything that \n you have achieved below"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 14)
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TARGET ACHIEVED BUTTON
  let targetAchievedButton: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(AppButtonImages.achievedIcon.image, for: .normal)
      button.addTarget(self, action: #selector(didTapTargetAchievedButton), for: .touchUpInside)
      return button
  }()
  // MARK: - PROGRESS LABEL
  let progressLabel: UILabel = {
    let label = UILabel()
    label.text = "Progress"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION VIEW
  let totalMeditationView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TOTAL MEDITATION ICON
  let totalMeditationIcon: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setImage(AppButtonImages.totalMeditationBlack.image, for: .normal)
      button.addTarget(self, action: #selector(didTapTotalMeditationButton), for: .touchUpInside)
      return button
  }()
  // MARK: - TOTAL MEDITATION TIME LABEL
  let totalMeditationTimerLabel: UILabel = {
    let label = UILabel()
    label.text = "120 h"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION TEXTLABEL
  let totalMeditationTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Total meditation"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
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
      button.setImage(AppButtonImages.playBlack.image, for: .normal)
      button.addTarget(self, action: #selector(didTapLongestSessionButton), for: .touchUpInside)
      return button
  }()
  // MARK: - LONGEST SESSION TIMER LABEL
  let longestSessionTimerLabel: UILabel = {
    let label = UILabel()
    label.text = "35 min"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - LONGEST SESSION BODY TEXTLABEL
  let longestSessionTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Longest session"
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - ACHIEVEMENTS LABEL
  let achievementsLabel: UILabel = {
    let label = UILabel()
    label.text = "Achievements"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION VIEW
  let meditationView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - TOTAL MEDITATION ICON
  let achievementIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(AppButtonImages.achievedIcon.image, for: .normal)
    button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
    return button
  }()
  // MARK: - TOTAL MEDITATION TIMER LABEL
  let achievementTimeLabel: UILabel = {
    let label = UILabel()
    label.text = "10 hours"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOTAL MEDITATION TEXT LABEL
  let achievementTextLabel: UILabel = {
    let label = UILabel()
    label.text = "You have achieved greatly in the last \n10 hours using our app"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 12)
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      setupViewsConstraints()
      addGestureRecognizerTargetView()
      addGestureRecognizerTotalMeditationView()
      addGestureRecognizerLongestSessionView()
    }
  override func viewDidLayoutSubviews() {
    scrollView.isScrollEnabled = true
    scrollView.showsVerticalScrollIndicator = false
    scrollView.contentSize = CGSize(width: 400, height: 800)
  }
  // MARK: - ADD GESTURE RECOGNIZER TO TARGET ACHIEVED VIEW
  func addGestureRecognizerTargetView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnTargetView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      targetView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnTargetView(sender: UITapGestureRecognizer) {
    didTapTargetAchievedButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO TOTAL MEDITATION VIEW
  func addGestureRecognizerTotalMeditationView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnTotalMeditationView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      totalMeditationView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnTotalMeditationView(sender: UITapGestureRecognizer) {
    didTapTotalMeditationButton()
  }
  // MARK: - ADD GESTURE RECOGNIZER TO LONGEST SESSION VIEW
  func addGestureRecognizerLongestSessionView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnLongestSessionView))
      tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      longestSessionView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnLongestSessionView(sender: UITapGestureRecognizer) {
    didTapLongestSessionButton()
  }
  // MARK: - DID TAP SETTINGS BUTTON
  @objc func didTapSettingsButton() {
    let newController = SettingsViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP TARGET ACHIEVED BUTTON
  @objc func didTapTargetAchievedButton() {
    presentCustomAlertOnMainThread(title: "Target Achieved", message: "Congratulations, you now have \n the Focus Master badge",  buttonTitle: "Explore", imageNamed: "LongestSession-Icon", arrowBtn: false)
  }
  // MARK: - DID TAP TOTAL MEDITATION BUTTON
  @objc func didTapTotalMeditationButton() {
    let newController = TotalMeditationViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP LONGEST SESSION BUTTON
  @objc func didTapLongestSessionButton() {
    let newController = LongestSessionViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
}
extension ProfilePageViewController: CustomAlertVCDelegate {
  func dismissAlertAndGoToAnotherScreen() {
    if let tabBarController = TabBarViewController() as? UITabBarController {
            tabBarController.selectedIndex = 1
      navigationController?.pushViewController(tabBarController, animated: true)
        }
  }
}
