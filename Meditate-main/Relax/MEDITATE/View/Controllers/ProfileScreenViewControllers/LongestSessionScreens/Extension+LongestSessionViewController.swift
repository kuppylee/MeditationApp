//
//  Extension+LongestSessionViewController.swift
//  MEDITATE
//
//  Created by Decagon on 05/10/2021.
//

import UIKit

extension LongestSessionViewController {
  // MARK: - SETUP VIEWS FUNCTION
  func setupViews() {
    view.addSubview(topBackArrowButton)
    view.addSubview(pageTitleLabel)
    view.addSubview(longestSessionView)
    view.addSubview(longestSessionIcon)
    view.addSubview(longestSessionTimeLabel)
    view.addSubview(longestSessionTextLabel)
    view.addSubview(longestSessionSecondView)
    view.addSubview(longestSessionSecondIcon)
    view.addSubview(longestSessionSecondTimeLabel)
    view.addSubview(longestSessionSecondTextLabel)
    view.addSubview(longestSessionThirdView)
    view.addSubview(longestSessionThirdIcon)
    view.addSubview(longestSessionThirdTimeLabel)
    view.addSubview(longestSessionThirdTextLabel)
    view.addSubview(shareButton)
    view.addSubview(shareForwardArrowButton)
  }
  // MARK: - SETUP CONSTRAINTS FUNCTION
  func setupViewConstraints() {
    setupViews()
    navigationController?.navigationBar.isHidden = true
    NSLayoutConstraint.activate([
      topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      longestSessionView.topAnchor.constraint(equalTo: pageTitleLabel.bottomAnchor, constant: 30),
      longestSessionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      longestSessionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      longestSessionView.heightAnchor.constraint(equalToConstant: 100),
      longestSessionIcon.topAnchor.constraint(equalTo: longestSessionView.topAnchor, constant: 20),
      longestSessionIcon.leadingAnchor.constraint(equalTo: longestSessionView.leadingAnchor, constant: 10),
      longestSessionTimeLabel.topAnchor.constraint(equalTo: longestSessionView.topAnchor, constant: 20),
      longestSessionTimeLabel.leadingAnchor.constraint(equalTo: longestSessionIcon.leadingAnchor, constant: 75),
      longestSessionTimeLabel.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor, constant: -10),
      longestSessionTextLabel.topAnchor.constraint(equalTo: longestSessionTimeLabel.bottomAnchor, constant: 5),
      longestSessionTextLabel.leadingAnchor.constraint(equalTo: longestSessionIcon.leadingAnchor, constant: 75),
      longestSessionTextLabel.trailingAnchor.constraint(equalTo: longestSessionView.trailingAnchor, constant: -10),
      longestSessionSecondView.topAnchor.constraint(equalTo: longestSessionView.bottomAnchor, constant: 30),
      longestSessionSecondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      longestSessionSecondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      longestSessionSecondView.heightAnchor.constraint(equalToConstant: 100),
      longestSessionSecondIcon.topAnchor.constraint(equalTo: longestSessionSecondView.topAnchor, constant: 20),
      longestSessionSecondIcon.leadingAnchor.constraint(equalTo: longestSessionSecondView.leadingAnchor, constant: 10),
      longestSessionSecondTimeLabel.topAnchor.constraint(equalTo: longestSessionSecondView.topAnchor, constant: 20),
      longestSessionSecondTimeLabel.leadingAnchor.constraint(equalTo: longestSessionSecondIcon.leadingAnchor, constant: 75),
      longestSessionSecondTimeLabel.trailingAnchor.constraint(equalTo: longestSessionSecondView.trailingAnchor, constant: -10),
      longestSessionSecondTextLabel.topAnchor.constraint(equalTo: longestSessionSecondTimeLabel.bottomAnchor, constant: 5),
      longestSessionSecondTextLabel.leadingAnchor.constraint(equalTo: longestSessionSecondIcon.leadingAnchor, constant: 75),
      longestSessionSecondTextLabel.trailingAnchor.constraint(equalTo: longestSessionSecondView.trailingAnchor, constant: -10),
      longestSessionThirdView.topAnchor.constraint(equalTo: longestSessionSecondView.bottomAnchor, constant: 30),
      longestSessionThirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      longestSessionThirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      longestSessionThirdView.heightAnchor.constraint(equalToConstant: 100),
      longestSessionThirdIcon.topAnchor.constraint(equalTo: longestSessionThirdView.topAnchor, constant: 20),
      longestSessionThirdIcon.leadingAnchor.constraint(equalTo: longestSessionThirdView.leadingAnchor, constant: 10),
      longestSessionThirdTimeLabel.topAnchor.constraint(equalTo: longestSessionThirdView.topAnchor, constant: 20),
      longestSessionThirdTimeLabel.leadingAnchor.constraint(equalTo: longestSessionThirdIcon.leadingAnchor, constant: 75),
      longestSessionThirdTimeLabel.trailingAnchor.constraint(equalTo: longestSessionThirdView.trailingAnchor, constant: -10),
      longestSessionThirdTextLabel.topAnchor.constraint(equalTo: longestSessionThirdTimeLabel.bottomAnchor, constant: 5),
      longestSessionThirdTextLabel.leadingAnchor.constraint(equalTo: longestSessionThirdIcon.leadingAnchor, constant: 75),
      longestSessionThirdTextLabel.trailingAnchor.constraint(equalTo: longestSessionThirdView.trailingAnchor, constant: -10),
      shareButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
      shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      shareButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      shareButton.heightAnchor.constraint(equalToConstant: 55),
      shareForwardArrowButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -63),
      shareForwardArrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
    ])
  }
}
