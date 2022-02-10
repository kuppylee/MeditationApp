//
//  OnboardingVC + extension.swift
//  MEDITATE
//
//  Created by  Decagon on 25/09/2021.
//

import UIKit

extension OnboardingViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.pageControl.numberOfPages = self.pages.count
        return pages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CollectionCell else { return UICollectionViewCell() }
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        if pageControl.currentPage == 0 {
                        let skipItem = UIBarButtonItem()
                        skipItem.title = "Skip"
                        skipItem.tintColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
                        skipItem.style = .plain
                        skipItem.target = self
                        skipItem.action = #selector(skipToSignUpPage)
                        navigationItem.rightBarButtonItem = skipItem
                        navigationItem.leftBarButtonItem = nil
                    } else {
                        let backItem = UIBarButtonItem()
                        backItem.image = UIImage(named: "Go-back")
                        backItem.style = .plain
                        backItem.tintColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
                        backItem.target = self
                        backItem.action = #selector(previousPage)
                        navigationItem.leftBarButtonItem = backItem
                        navigationItem.rightBarButtonItem = nil
                    }
    }
    func setupConstraintsForNextButtonAndCollectionView() {
            view.addSubview(nextButton)
            view.addSubview(collectionView)
        collectionView.anchorWithConstantsToTop(top: view.safeAreaLayoutGuide.topAnchor,
                                                left: view.leftAnchor, bottom: nextButton.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
            NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.heightAnchor.constraint(equalToConstant: 64),
                nextButton.widthAnchor.constraint(equalToConstant: 64)
            ])
        }
//    view.addSubview(nextArrow)
//            view.addSubview(collectionView)
//            collectionView.anchorWithConstantsToTop(view.safeAreaLayoutGuide.topAnchor,
//                                                    left: view.leftAnchor, bottom: nextArrow.topAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 30, rightConstant: 0)
//            NSLayoutConstraint.activate([
//                nextArrow.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
//                nextArrow.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                nextArrow.heightAnchor.constraint(equalToConstant: 64),
//              nextArrow.widthAnchor.constraint(equalToConstant: 64)
//            ])
}
