//
//  Extension+ProfileScreensViewController.swift
//  MEDITATE
//
//  Created by Decagon on 05/10/2021.
//

import UIKit

extension ProfilePageViewController {
  // MARK: - SETUP VIEWS FOR PROFILE PAGE VIEWCONTROLLER
  func setupViews() {
    view.addSubview(profileLabel)
    view.addSubview(topSettingsButton)
    contentView.addSubview(userProfileButton)
    contentView.addSubview(usernameLabel)
    contentView.addSubview(userEmailLabel)
    contentView.addSubview(userStrokeButton)
    contentView.addSubview(targetView)
    contentView.addSubview(targetAchievedTitleLabel)
    contentView.addSubview(targetAchievedBodyTextLabel)
    contentView.addSubview(targetAchievedButton)
    contentView.addSubview(totalMeditationView)
    contentView.addSubview(longestSessionView)
    contentView.addSubview(progressLabel)
    contentView.addSubview(totalMeditationIcon)
    contentView.addSubview(totalMeditationTimerLabel)
    contentView.addSubview(totalMeditationTextLabel)
    contentView.addSubview(longestSessionIcon)
    contentView.addSubview(longestSessionTimerLabel)
    contentView.addSubview(longestSessionTextLabel)
    contentView.addSubview(achievementsLabel)
    contentView.addSubview(meditationView)
    contentView.addSubview(achievementIcon)
    contentView.addSubview(achievementTimeLabel)
    contentView.addSubview(achievementTextLabel)
  }
  func setupScrollView() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 30).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }
  // MARK: - SETUP CONSTRAINTS
  func setupViewsConstraints() {
    setupViews()
    setupScrollView()
    NSLayoutConstraint.activate([
      profileLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      profileLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      topSettingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      topSettingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      userProfileButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      userProfileButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 37),
      userStrokeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 11),
      userStrokeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      usernameLabel.leadingAnchor.constraint(equalTo: userStrokeButton.trailingAnchor, constant: 20),
      userEmailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
      userEmailLabel.leadingAnchor.constraint(equalTo: userStrokeButton.trailingAnchor, constant: 20),
      targetView.topAnchor.constraint(equalTo: userProfileButton.bottomAnchor, constant: 60),
      targetView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      targetView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      targetView.heightAnchor.constraint(equalToConstant: 100),
      targetAchievedTitleLabel.topAnchor.constraint(equalTo: targetView.topAnchor, constant: 14),
      targetAchievedTitleLabel.leadingAnchor.constraint(equalTo: targetView.leadingAnchor, constant: 10),
      targetAchievedBodyTextLabel.topAnchor.constraint(equalTo: targetAchievedTitleLabel.bottomAnchor, constant: 10),
      targetAchievedBodyTextLabel.leadingAnchor.constraint(equalTo: targetView.leadingAnchor, constant: 10),
      targetAchievedButton.topAnchor.constraint(equalTo: targetView.topAnchor, constant: 20),
      targetAchievedButton.trailingAnchor.constraint(equalTo: targetView.trailingAnchor, constant: -10),
      progressLabel.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 70),
      progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      totalMeditationView.heightAnchor.constraint(equalToConstant: 150),
      totalMeditationView.widthAnchor.constraint(equalToConstant: 160),
      totalMeditationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      totalMeditationView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 20),
      longestSessionView.heightAnchor.constraint(equalToConstant: 150),
      longestSessionView.widthAnchor.constraint(equalToConstant: 160),
      longestSessionView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 20),
      longestSessionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      longestSessionView.leadingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: 31),
      totalMeditationIcon.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 25),
      totalMeditationIcon.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -40),
      totalMeditationIcon.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor, constant: 40),
      totalMeditationTimerLabel.topAnchor.constraint(equalTo: totalMeditationIcon.bottomAnchor, constant: 18),
      totalMeditationTimerLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -55),
      totalMeditationTimerLabel.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor, constant: 55),
      totalMeditationTextLabel.topAnchor.constraint(equalTo: totalMeditationTimerLabel.bottomAnchor, constant: 5),
      totalMeditationTextLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -35),
      totalMeditationTextLabel.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor, constant: 35),
      longestSessionIcon.topAnchor.constraint(equalTo: longestSessionView.topAnchor, constant: 25),
      longestSessionIcon.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor, constant: -40),
      longestSessionIcon.leadingAnchor.constraint(equalTo: longestSessionView.leadingAnchor, constant: 40),
      longestSessionTimerLabel.topAnchor.constraint(equalTo: longestSessionIcon.bottomAnchor, constant: 18),
      longestSessionTimerLabel.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor, constant: -55),
      longestSessionTimerLabel.leadingAnchor.constraint(equalTo: longestSessionView.leadingAnchor, constant: 55),
      longestSessionTextLabel.topAnchor.constraint(equalTo: longestSessionTimerLabel.bottomAnchor, constant: 5),
      longestSessionTextLabel.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor, constant: -35),
      longestSessionTextLabel.leadingAnchor.constraint(equalTo: longestSessionView.leadingAnchor, constant: 35),
      achievementsLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 50),
      achievementsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      meditationView.topAnchor.constraint(equalTo: achievementsLabel.bottomAnchor, constant: 30),
      meditationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      meditationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      meditationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      achievementIcon.topAnchor.constraint(equalTo: meditationView.topAnchor, constant: 20),
      achievementIcon.leadingAnchor.constraint(equalTo: meditationView.leadingAnchor, constant: 10),
      achievementTimeLabel.topAnchor.constraint(equalTo: meditationView.topAnchor, constant: 20),
      achievementTimeLabel.leadingAnchor.constraint(equalTo: achievementIcon.leadingAnchor, constant: 75),
      achievementTimeLabel.trailingAnchor.constraint(equalTo: meditationView.trailingAnchor, constant: -10),
      achievementTextLabel.topAnchor.constraint(equalTo: achievementTimeLabel.bottomAnchor, constant: 5),
      achievementTextLabel.leadingAnchor.constraint(equalTo: achievementIcon.leadingAnchor, constant: 75),
      achievementTextLabel.trailingAnchor.constraint(equalTo: meditationView.trailingAnchor, constant: -10)
    ])
  }
}
