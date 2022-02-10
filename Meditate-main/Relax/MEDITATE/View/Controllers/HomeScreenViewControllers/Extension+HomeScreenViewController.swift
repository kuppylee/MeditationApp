//
//  Extension+.swift
//  MEDITATE
//
//  Created by Decagon on 04/10/2021.
//

import UIKit

extension HomeScreenViewController {
  // MARK: - FUNCTION
  func addDefaultViews() {
    contentView.addSubview(collectionView)
  }
  // MARK: - FUNCTION
  func collectionViewConstraints() {
    addDefaultViews()
    collectionView.anchorWithConstantsToTop(top: recommendedTextLabel.topAnchor,
                                            left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, topConstant: 20, leftConstant: 30, bottomConstant: 250, rightConstant: 30)
  }
  // MARK: - COLLECTION VIEW
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
    homeCell.layer.cornerRadius = 40
    homeCell.nextButtonIcon.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    let card = cards[indexPath.row]
    homeCell.card = card
    return homeCell
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width - 100, height: 200)
  }
  func setupScrollView() {
    view.addSubview(scrollView)
    navigationController?.navigationBar.isHidden = true
    scrollView.addSubview(contentView)
    scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
    scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: dashboardLabel.bottomAnchor, constant: 30).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
  }
  @objc func didTapNextButton () {
    let newController = MeditationViewController()
    navigationController?.pushViewController(newController, animated: true)
  }
}
