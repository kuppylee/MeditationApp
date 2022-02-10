//
//  MindJournalViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 18/10/2021.
//

import UIKit

class MindJournalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let cards: [JobStressCard] = {
      let firstCard = JobStressCard(title: "Deep Breathing", time: "25 mins", imageName: "Deep Breathing")
      let secondCard = JobStressCard(title: "Stressful Times", time: "45 mins", imageName: "Stressfull Times")
      let thirdCard = JobStressCard(title: "Meditation Break", time: "10 mins", imageName: "Meditation Break")
      return [firstCard, secondCard, thirdCard]
    }()

    // MARK: - COLLECTION VIEW
    lazy var collectionView: UICollectionView = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .vertical
      layout.minimumLineSpacing = 35
      let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
      collectionView.dataSource = self
      collectionView.delegate = self
      collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      collectionView.showsHorizontalScrollIndicator = false
      collectionView.translatesAutoresizingMaskIntoConstraints = false
      return collectionView
    }()
    // MARK: - BACK ARROW BUTTON
    let topBackArrowButton: UIButton = {
      let button = UIButton()
      button.addTarget(self, action: #selector(didTapTopBackArrowButton), for: .touchUpInside)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.setBackgroundImage(AppButtonImages.goBackButton.image, for: .normal)
      return button
    }()
    // MARK: - PAGE TITLE
    let pageTitleLabel: UILabel = {
      let label = UILabel()
      label.text = "Mind Journal"
      label.numberOfLines = 2
      label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    let cellId = "cellId"
    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
      collectionView.register(JobStressCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
      collectionViewConstraints()
    }
    // MARK: - SETUP VIEWS FUNCTION
    func addDefaultViews() {
      view.addSubview(pageTitleLabel)
      view.addSubview(topBackArrowButton)
      view.addSubview(collectionView)
      navigationController?.navigationBar.isHidden = true
    }
    // MARK: - FUNCTION
    func collectionViewConstraints() {
      addDefaultViews()
      collectionView.anchorWithConstantsToTop(top: pageTitleLabel.topAnchor,
                                              left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 40, leftConstant: 30, bottomConstant: 30, rightConstant: 30)
      NSLayoutConstraint.activate([
        topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ])
    }
    // MARK: - COLLECTION VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return cards.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let jobCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? JobStressCollectionViewCell else { return UICollectionViewCell() }
      jobCell.layer.cornerRadius = 50
      let card = cards[indexPath.row]
      jobCell.card = card
      return jobCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: view.frame.width, height: 200)
    }
    @objc func didTapTopBackArrowButton() {
      navigationController?.popViewController(animated: true)
    }

}
