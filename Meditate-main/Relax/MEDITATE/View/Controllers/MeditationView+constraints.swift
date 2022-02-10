//
//  MeditationView+constraints.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//

import UIKit
extension MeditationViewController{
  // MARK: - function to add all subview to view
  func addDefaultViews() {
    view.addSubview(backButton)
    view.addSubview(sleepBetterView)
    view.addSubview(nameLabel)
    view.addSubview(timeLabel)
    view.addSubview(playButtonIcon)
    view.addSubview(imageView)
    view.addSubview(sessionLabel)
    view.addSubview(collectionView)
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
  }
  // MARK: - function to constrian all sub view
  func constraintViews() {
    addDefaultViews()
    self.navigationItem.setHidesBackButton(true, animated: true)
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
      backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
      backButton.heightAnchor.constraint(equalToConstant: 28),
      backButton.widthAnchor.constraint(equalToConstant: 28),
      sleepBetterView.topAnchor.constraint(equalTo: view.topAnchor, constant: 132),
      sleepBetterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      sleepBetterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      sleepBetterView.heightAnchor.constraint(equalToConstant: 230),
      nameLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 36),
      nameLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
      timeLabel.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 71),
      timeLabel.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
      playButtonIcon.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 51),
      playButtonIcon.leadingAnchor.constraint(equalTo: sleepBetterView.leadingAnchor, constant: 15),
      playButtonIcon.bottomAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 37),
      imageView.topAnchor.constraint(equalTo: sleepBetterView.topAnchor, constant: 90),
      imageView.trailingAnchor.constraint(equalTo: sleepBetterView.trailingAnchor, constant: 0),
      imageView.bottomAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 0),
      sessionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30 ),
      sessionLabel.topAnchor.constraint(equalTo: sleepBetterView.bottomAnchor, constant: 60),
      sessionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 270)
    ])
    collectionView.anchorWithConstantsToTop(top: sessionLabel.topAnchor,
                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 50, leftConstant: 30, bottomConstant: 30, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return sessionCards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
guard let sessionCell = collectionView.dequeueReusableCell(withReuseIdentifier: MeditationSessionCollectionViewCell.identifier, for: indexPath)
          as? MeditationSessionCollectionViewCell else { return UICollectionViewCell() }
    sessionCell.sessionCard = sessionCards[indexPath.row]
    sessionCell.backgroundColor = UIColor(red: 0.97, green: 0.98, blue: 0.98, alpha: 1.00)
    return sessionCell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      let sessions = SessionsViewController()
      let badDreams = BadDreamsController()
      let panicAttack = PanicAttackController()
      let phoneAddiction = PhoneAddictionController()
      let overThinking = OverthinkingController()
      if indexPath.row == 0 {
          navigationController?.pushViewController(sessions, animated: true)
      }
      if indexPath.row == 1 {
          navigationController?.pushViewController(badDreams, animated: true)
      }
      if indexPath.row == 2 {
          navigationController?.pushViewController(panicAttack, animated: true)
      }
      if indexPath.row == 3 {
          navigationController?.pushViewController(phoneAddiction, animated: true)
      }
      if indexPath.row == 4 {
          navigationController?.pushViewController(overThinking, animated: true)
      }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 65)
  }
}
