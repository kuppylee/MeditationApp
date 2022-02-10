//
//  Extension+TotalMeditationViewController.swift
//  MEDITATE
//
//  Created by Decagon on 05/10/2021.
//

import UIKit

extension TotalMeditationViewController {
  // MARK: - SETUP VIEWS FUNCTION
  func  setupViews() {
    view.addSubview(topBackArrowButton)
    view.addSubview(pageTitleLabel)
    view.addSubview(totalMeditationView)
    view.addSubview(totalMeditationIcon)
    view.addSubview(totalMeditationTimerLabel)
    view.addSubview(totalMeditationTextLabel)
    view.addSubview(totalTimeSectionLabel)
    view.addSubview(totalMeditationTimeLabel)
    view.addSubview(meditationDurationLabel)
    view.addSubview(mondayGraphImageView)
    view.addSubview(tuesdayGraphImageView)
    view.addSubview(wednesdayGraphImageView)
    view.addSubview(thursdayGraphImageView)
    view.addSubview(fridayGraphImageView)
    view.addSubview(saturdayGraphImageView)
    view.addSubview(sundayGraphImageView)
    view.addSubview(statisticsLabel)
    view.addSubview(stressLabel)
    view.addSubview(happinessLabel)
    view.addSubview(increaseStressLevelIcon)
    view.addSubview(decreaseStressLevelIcon)
    view.addSubview(increaseHappinessLevelLabel)
    view.addSubview(decreaseStressLevelLabel)
    view.addSubview(decreaseStressForwardIcon)
    view.addSubview(increaseHappinessForwardIcon)
  }
  // MARK: - SETUP CONSTRAINTSFUNCTION
  func setupConstraintsTotalMeditation() {
    setupViews()
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      totalMeditationView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 30),
      totalMeditationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      totalMeditationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      totalMeditationView.heightAnchor.constraint(equalToConstant: 100),
      totalMeditationIcon.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 20),
      totalMeditationIcon.leadingAnchor.constraint(equalTo: totalMeditationView.leadingAnchor, constant: 10),
      totalMeditationTimerLabel.topAnchor.constraint(equalTo: totalMeditationView.topAnchor, constant: 20),
      totalMeditationTimerLabel.leadingAnchor.constraint(equalTo: totalMeditationIcon.leadingAnchor, constant: 75),
      totalMeditationTimerLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -10),
      totalMeditationTextLabel.topAnchor.constraint(equalTo: totalMeditationTimerLabel.bottomAnchor, constant: 5),
      totalMeditationTextLabel.leadingAnchor.constraint(equalTo: totalMeditationIcon.leadingAnchor, constant: 75),
      totalMeditationTextLabel.trailingAnchor.constraint(equalTo: totalMeditationView.trailingAnchor, constant: -10),
      totalTimeSectionLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 50),
      totalTimeSectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      totalMeditationTimeLabel.topAnchor.constraint(equalTo: totalTimeSectionLabel.bottomAnchor, constant: 10),
      totalMeditationTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      meditationDurationLabel.topAnchor.constraint(equalTo: totalMeditationView.bottomAnchor, constant: 50),
      meditationDurationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      mondayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 160),
      mondayGraphImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      tuesdayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 90),
      tuesdayGraphImageView.leadingAnchor.constraint(equalTo: mondayGraphImageView.leadingAnchor, constant: 57),
      wednesdayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 145),
      wednesdayGraphImageView.leadingAnchor.constraint(equalTo: tuesdayGraphImageView.leadingAnchor, constant: 57),
      thursdayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 65),
      thursdayGraphImageView.leadingAnchor.constraint(equalTo: wednesdayGraphImageView.leadingAnchor, constant: 57),
      fridayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 175),
      fridayGraphImageView.leadingAnchor.constraint(equalTo: thursdayGraphImageView.leadingAnchor, constant: 57),
      saturdayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 120),
      saturdayGraphImageView.leadingAnchor.constraint(equalTo: fridayGraphImageView.leadingAnchor, constant: 57),
      sundayGraphImageView.topAnchor.constraint(equalTo: totalMeditationTimeLabel.bottomAnchor, constant: 80),
      sundayGraphImageView.leadingAnchor.constraint(equalTo: saturdayGraphImageView.leadingAnchor, constant: 57),
      statisticsLabel.topAnchor.constraint(equalTo: saturdayGraphImageView.bottomAnchor, constant: 50),
      statisticsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      decreaseStressLevelIcon.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 30),
      decreaseStressLevelIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      increaseStressLevelIcon.topAnchor.constraint(equalTo: decreaseStressLevelIcon.bottomAnchor, constant: 30),
      increaseStressLevelIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      stressLabel.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 30),
      stressLabel.leadingAnchor.constraint(equalTo: decreaseStressLevelIcon.leadingAnchor, constant: 75),
      decreaseStressLevelLabel.topAnchor.constraint(equalTo: stressLabel.bottomAnchor, constant: 10),
      decreaseStressLevelLabel.leadingAnchor.constraint(equalTo: decreaseStressLevelIcon.leadingAnchor, constant: 75),
      happinessLabel.topAnchor.constraint(equalTo: decreaseStressLevelLabel.bottomAnchor, constant: 30),
      happinessLabel.leadingAnchor.constraint(equalTo: increaseStressLevelIcon.leadingAnchor, constant: 75),
      increaseHappinessLevelLabel.topAnchor.constraint(equalTo: happinessLabel.bottomAnchor, constant: 10),
      increaseHappinessLevelLabel.leadingAnchor.constraint(equalTo: increaseStressLevelIcon.leadingAnchor, constant: 75),
      decreaseStressForwardIcon.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 40),
      decreaseStressForwardIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      increaseHappinessForwardIcon.topAnchor.constraint(equalTo: decreaseStressLevelLabel.bottomAnchor, constant: 40),
      increaseHappinessForwardIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
    ])
  }
}
