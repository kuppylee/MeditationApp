//
//  ExploreViewController.swift
//  MEDITATE
//
//  Created by Decagon on 02/10/2021.
//

import UIKit
class ExploreViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  // MARK: - VARIABLE TO HOLD ALL CARD IN AN ARRAY
  let cards: [Card] = {
    let firstCard = Card(title: AppImages.anxietyProblems.image, time: "20 mins", imageName: AppImages.anxietyProblems.image)
    let secondCard = Card(title: AppImages.sleepBetter.image, time: "35 mins", imageName: AppImages.anxietyProblems.image)
    let thirdCard = Card(title: AppImages.creativeBlock.image, time: "15 mins", imageName: AppImages.creativeBlock.image)
    return [firstCard, secondCard, thirdCard]
  }()
  // MARK: - EXPLORE LABEL
  let exploreLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Explore"
    label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
    label.textAlignment = .center
    label.numberOfLines = 1
    return label
  }()
  // MARK: - COLLECTION VIEW
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 45
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor =  UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.showsVerticalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  // MARK: - FILTER IMAGE
  let filterImage: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(AppButtonImages.filter.image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  let cellId = "cellId"
  // MARK: - VIEW DID LOAD
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.00)
    collectionView.register(ExploreCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    constraintViews()
  }
}
