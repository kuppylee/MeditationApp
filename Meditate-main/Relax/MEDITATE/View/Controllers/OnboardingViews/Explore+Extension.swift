//
//  Explore+Extension.swift
//  MEDITATE
//
//  Created by Decagon on 03/10/2021.
//
import UIKit
// MARK: - EXTENSION
extension ExploreViewController {
  // MARK: - FUNCTION
  func addDefaultViews() {
    view.addSubview(exploreLabel)
    view.addSubview(filterImage)
    view.addSubview(collectionView)
  }
  // MARK: - FUNCTION TO SET VIEW CONSTRIANT
  func constraintViews() {
    addDefaultViews()
    self.navigationItem.setHidesBackButton(true, animated: true)
    NSLayoutConstraint.activate([
      exploreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      exploreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
      exploreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -256),
      filterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 317),
      filterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 76),
      filterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
    ])
    collectionView.anchorWithConstantsToTop(top: exploreLabel.topAnchor,
                                            left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 90, leftConstant: 30, bottomConstant: 80, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let exploreCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ExploreCollectionViewCell else { return UICollectionViewCell() }
    exploreCell.layer.cornerRadius = 60
    let card = cards[indexPath.row]
    exploreCell.card = card
    return exploreCell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
}
