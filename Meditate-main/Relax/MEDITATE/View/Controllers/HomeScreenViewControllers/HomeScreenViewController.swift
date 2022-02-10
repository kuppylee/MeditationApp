//
//  HomeScreenViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit

class HomeScreenViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIGestureRecognizerDelegate {
  // MARK: - SETUP MODEL FOR CELL CONTENT
  let cards: [RecommendedCard] = {
    let firstCard = RecommendedCard(title: "Anxiety Problems", time: "20 mins", imageName: "Anxiety Problems")
    let secondCard = RecommendedCard(title: "Sleep Better", time: "35 mins", imageName: "Sleep Better")
    let thirdCard = RecommendedCard(title: "Creative Block", time: "15 mins", imageName: "Creative Block")
    return [firstCard, secondCard, thirdCard]
  }()
  // MARK: - DASHBOARD LABEL
  let dashboardLabel: UILabel = {
    let label = UILabel()
    label.text = "Dashboard"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - TOP FILTER BUTTON
  let topFilterButton: UIButton = {
    let button = UIButton()
    button.addTarget(self, action: #selector(didTapSettingsButton), for: .touchUpInside)
    button.setBackgroundImage(AppButtonImages.filter.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  // MARK: - DAILY RELAXATION VIEW
  let dailyRelaxationView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - DAILY RELAXATION ICON
  let dailyRelaxationIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setBackgroundImage(UIImage(named: "LongestSession-Icon"), for: .normal)
    button.addTarget(self, action: #selector(didTapRelaxButton), for: .touchUpInside)
    return button
  }()
  // MARK: - DAILY RELAXATION LABEL
  let dailyRelaxationTopLabel: UILabel = {
    let label = UILabel()
    label.text = "Daily Relaxation"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 16)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - DAILY RELAXATION TEXT LABEL
  let dailyRelaxationTextLabel: UILabel = {
    let label = UILabel()
    label.text = "It is the right time to relax and get \n rid of all the stress"
    label.numberOfLines = 2
    label.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 14)
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - RECOMMENDED TEXT LABEL
  let recommendedTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Recommended"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 23)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - COLLECTION VIEW
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 25
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isUserInteractionEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  // MARK: - CATEGORIES TEXT LABEL
  let categoriesTextLabel: UILabel = {
    let label = UILabel()
    label.text = "Categories"
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 23)
    label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - JOB STRESS VIEW
  let jobStressView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - JOB STRESS ICON
  let jobStressIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.jobStress.image, for: .normal)
    button.addTarget(self, action: #selector(didTapjobStressButton), for: .touchUpInside)
    return button
  }()
  // MARK: - JOB STRESS LABEL
  let jobStressLabel: UILabel = {
    let label = UILabel()
    label.text = "Job Stress"
    label.textAlignment = .center
    label.font = UIFont(name: "Nunito Sans", size: 20)
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  // MARK: - MIND JOURNAL VIEW
  let mindJournalView: UIView = {
    let view = UIView()
    view.backgroundColor = .white
    view.layer.cornerRadius = 15
    view.isUserInteractionEnabled = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // MARK: - MIND JOURNAL ICON
  let mindJournalIcon: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(AppButtonImages.mindJournal.image, for: .normal)
    button.addTarget(self, action: #selector(didTapmindJournalButton), for: .touchUpInside)
    return button
  }()
  // MARK: - MIND JOURNAL LABEL
  let mindJournalLabel: UILabel = {
    let label = UILabel()
    label.text = "Mind Journal"
    label.textAlignment = .center
    label.numberOfLines = 2
    label.font = UIFont(name: "Nunito Sans", size: 20)
    label.font = UIFont(name: AppFonts.nunitoSansSemiBold.font, size: 20)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
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
  let cellId = "cellId"
  override func viewDidLoad() {
    super.viewDidLoad()
    setupDashboardConstriants()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    collectionViewConstraints()
    setupScrollView()
    addGestureRecognizerDailyRelaxationView()
    addGestureRecognizerJobStressView()
    addGestureRecognizerMindJournalView()
  }
  override func viewDidLayoutSubviews() {
    scrollView.isScrollEnabled = true
    scrollView.showsVerticalScrollIndicator = false
    scrollView.contentSize = CGSize(width: 400, height: 800)
  }
  func addGestureRecognizerDailyRelaxationView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnDailyRelaxationView))
    tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      dailyRelaxationView.addGestureRecognizer(tapGesture)
  }
  @objc func onClickOnDailyRelaxationView(sender: UITapGestureRecognizer) {
    didTapRelaxButton()
  }
  func addGestureRecognizerJobStressView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnJobStressView))
    tapGesture.delegate = self
      view.isUserInteractionEnabled = true
      jobStressView.addGestureRecognizer(tapGesture)
  }
    func addGestureRecognizerMindJournalView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onClickOnMindJournalView))
      tapGesture.delegate = self
        view.isUserInteractionEnabled = true
        mindJournalView.addGestureRecognizer(tapGesture)
    }
  @objc func onClickOnJobStressView(sender: UITapGestureRecognizer) {
    didTapjobStressButton()
  }
    @objc func onClickOnMindJournalView(sender: UITapGestureRecognizer) {
      didTapmindJournalButton()
    }
  // MARK: - SETUP VIEWS FUNCTION
  func setupDashboardsViews() {
    self.navigationItem.setHidesBackButton(true, animated: true)
    view.addSubview(dashboardLabel)
    view.addSubview(topFilterButton)
    contentView.addSubview(dailyRelaxationView)
    contentView.addSubview(dailyRelaxationIcon)
    contentView.addSubview(dailyRelaxationTopLabel)
    contentView.addSubview(dailyRelaxationTextLabel)
    contentView.addSubview(recommendedTextLabel)
    contentView.addSubview(categoriesTextLabel)
    contentView.addSubview(jobStressView)
    contentView.addSubview(jobStressIcon)
    contentView.addSubview(jobStressLabel)
    contentView.addSubview(mindJournalView)
    contentView.addSubview(mindJournalIcon)
    contentView.addSubview(mindJournalLabel)
  }
  // MARK: - SETUP CONSTRAINTS FUNCTION
  func setupDashboardConstriants() {
    setupDashboardsViews()
    NSLayoutConstraint.activate([
      dashboardLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      dashboardLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      topFilterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      topFilterButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
      dailyRelaxationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
      dailyRelaxationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      dailyRelaxationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      dailyRelaxationView.heightAnchor.constraint(equalToConstant: 100),
      dailyRelaxationIcon.topAnchor.constraint(equalTo: dailyRelaxationView.topAnchor, constant: 20),
      dailyRelaxationIcon.leadingAnchor.constraint(equalTo: dailyRelaxationView.leadingAnchor, constant: 10),
      dailyRelaxationTopLabel.topAnchor.constraint(equalTo: dailyRelaxationView.topAnchor, constant: 20),
      dailyRelaxationTopLabel.leadingAnchor.constraint(equalTo: dailyRelaxationIcon.leadingAnchor, constant: 75),
      dailyRelaxationTopLabel.trailingAnchor.constraint(equalTo: dailyRelaxationView.trailingAnchor, constant: -10),
      dailyRelaxationTextLabel.topAnchor.constraint(equalTo: dailyRelaxationTopLabel.bottomAnchor, constant: 5),
      dailyRelaxationTextLabel.leadingAnchor.constraint(equalTo: dailyRelaxationIcon.leadingAnchor, constant: 75),
      dailyRelaxationTextLabel.trailingAnchor.constraint(equalTo: dailyRelaxationView.trailingAnchor, constant: -10),
      recommendedTextLabel.topAnchor.constraint(equalTo: dailyRelaxationView.bottomAnchor, constant: 70),
      recommendedTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      categoriesTextLabel.topAnchor.constraint(equalTo: recommendedTextLabel.bottomAnchor, constant: 300),
      categoriesTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      jobStressView.heightAnchor.constraint(equalToConstant: 150),
      jobStressView.widthAnchor.constraint(equalToConstant: 160),
      jobStressView.topAnchor.constraint(equalTo: categoriesTextLabel.bottomAnchor, constant: 20),
      jobStressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
      jobStressIcon.topAnchor.constraint(equalTo: jobStressView.topAnchor, constant: 25),
      jobStressIcon.leadingAnchor.constraint(equalTo: jobStressView.leadingAnchor, constant: 30),
      jobStressLabel.topAnchor.constraint(equalTo: jobStressIcon.bottomAnchor, constant: 18),
      jobStressLabel.trailingAnchor.constraint(equalTo: jobStressView.trailingAnchor, constant: -20),
      jobStressLabel.leadingAnchor.constraint(equalTo: jobStressView.leadingAnchor, constant: 20),
      mindJournalView.heightAnchor.constraint(equalToConstant: 150),
      mindJournalView.widthAnchor.constraint(equalToConstant: 160),
      mindJournalView.topAnchor.constraint(equalTo: categoriesTextLabel.bottomAnchor, constant: 20),
      mindJournalView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
      mindJournalView.leadingAnchor.constraint(equalTo: jobStressView.trailingAnchor, constant: 31),
      mindJournalView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      mindJournalIcon.topAnchor.constraint(equalTo: mindJournalView.topAnchor, constant: 25),
      mindJournalIcon.leadingAnchor.constraint(equalTo: mindJournalView.leadingAnchor, constant: 30),
      mindJournalLabel.topAnchor.constraint(equalTo: mindJournalIcon.bottomAnchor, constant: 18),
      mindJournalLabel.trailingAnchor.constraint(equalTo: mindJournalView.trailingAnchor, constant: -20),
      mindJournalLabel.leadingAnchor.constraint(equalTo: mindJournalView.leadingAnchor, constant: 20)
    ])
  }
  // MARK: - SETTINGS BUTTON FUNCTION
  @objc func didTapSettingsButton() {
  }
  // MARK: - DID TAP RELAX VIEW
  @objc func didTapRelaxButton() {
  presentCustomAlertOnMainThread(title: "Time to Meditate", message: "We think that is the time for you\n to do some meditation", buttonTitle: "Start Now", imageNamed: "LongestSession-Icon", arrowBtn: true)
  }
  // MARK: - DID TAP JOB STRESS BUTTON FUNCTION
  @objc func didTapjobStressButton() {
    let newController = JobStressViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
  // MARK: - DID TAP MIND JOURNAL BUTTON FUNCTION
  @objc func didTapmindJournalButton() {
    let newController = MindJournalViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
}
