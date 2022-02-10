//
//  MeditationViewController.swift
//  MEDITATE
//
//  Created by Decagon on 11/10/2021.
//
import UIKit
class MeditationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  // MARK: - VARIABLE TO HOLD ALL SESSION CARD IN AN ARRAY
  let sessionCards: [SessionCard] = {
    let firstCard = SessionCard(title: "Sleep Better", time: "2 min / 5 min", icon: AppButtonImages.duration.image)
    let secondCard = SessionCard(title: "Bad Dreams", time: "0 min / 10 min", icon: AppButtonImages.longestSessionIcon.image)
    let thirdCard = SessionCard(title: "Panic Attacks", time: "0 min / 5 min ", icon: AppButtonImages.longestSessionIcon.image)
    let fourthCard = SessionCard(title: "Phone Addiction", time: "0 min / 15min", icon: AppButtonImages.longestSessionIcon.image)
    let fifthCard = SessionCard(title: "Overthinking", time: "0 min / 5 min", icon: AppButtonImages.longestSessionIcon.image)
    return [firstCard, secondCard, thirdCard, fourthCard, fifthCard]
  }()
  // MARK: - Button to go back
  let backButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.goBackButton.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    return button
  }()
  // MARK: - view to display session activity
  let sleepBetterView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.white.color
    view.layer.cornerRadius = 15
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - label to display name of session
  lazy var nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Sleep better"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - label to display time
  lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.text = "35 min"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - setting play icon image on a button
  lazy var playButtonIcon: UIButton = {
    let button = UIButton()
    button.setImage(AppButtonImages.longestSessionIcon.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - session(sleep better) image view display
  lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: AppImages.sleepBetter.image)
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  // MARK: - label to display sessions
  lazy var sessionLabel: UILabel = {
    let label = UILabel()
    label.text = "Sessions"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 25)
    label.numberOfLines = 1
    return label
  }()
  // MARK: - view to display information about a session
  let sessionSubView: UIView = {
    let view = UIView()
    view.backgroundColor = AppColors.white.color
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - COLLECTION VIEW
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 30
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  // MARK: - button to go back to previous view controller
  @objc func backButtonPressed () {
      navigationController?.popViewController(animated: true)
  }
  // MARK: - FUNCTION VIEW DID LOAD
  override func viewDidLoad () {
    super.viewDidLoad()
    collectionView.register(MeditationSessionCollectionViewCell.self, forCellWithReuseIdentifier: MeditationSessionCollectionViewCell.identifier)
    constraintViews()
  }
}
