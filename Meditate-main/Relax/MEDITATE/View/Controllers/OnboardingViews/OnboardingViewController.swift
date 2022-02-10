//
//  OnboardingViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 24/09/2021.
//

import UIKit

class OnboardingViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    let pages: [Page] = {
        let firstPage = Page(title: "Reduce Stress", message: "We are here to help you get rid \n of the stress you might have.", imageName: "page1")
        let secondPage = Page(title: "Constant Support", message: "We are always here to support \n you no matter what.", imageName: "page2")
        let thirdPage = Page(title: "Stay Energized", message: "Our app will help you to stay \n energized all the time.", imageName: "page3")
        return [firstPage, secondPage, thirdPage]
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Button"), for: .normal)
        button.addTarget(self, action: #selector(goToNextpage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.backgroundColor = .white
        return pageControl
    }()

    private func goBackArrowButton() {
        let backItem = UIBarButtonItem()
        backItem.image = UIImage(named: "Go-back")
        backItem.style = .plain
        backItem.tintColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
        backItem.target = self
        backItem.action = #selector(previousPage)
        navigationItem.leftBarButtonItem = backItem
        navigationItem.rightBarButtonItem = nil
    }
    private func goToNextPageAction() {
        let nextIndex = pageControl.currentPage + 1
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    @objc func goToNextpage() {
        if pageControl.currentPage == pages.count - 1 {
            goBackArrowButton()
            skipToSignUpPage()
        } else if pageControl.currentPage == pages.count - 3 {
            goBackArrowButton()
            goToNextPageAction()
        } else {
            goToNextPageAction()
        }
    }
    @objc func skipToSignUpPage() {
        UserDefaults.standard.setValue(true, forKey: "onboarded")
        let signUpController = SignUpEmailViewController()
        navigationController?.pushViewController(signUpController, animated: true)
        navigationController?.isNavigationBarHidden = true
    }
    private func skipButton() {
        let skipItem = UIBarButtonItem()
        skipItem.title = "Skip"
        skipItem.tintColor = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
        skipItem.style = .plain
        skipItem.target = self
        skipItem.action = #selector(skipToSignUpPage)
        navigationItem.rightBarButtonItem = skipItem
        navigationItem.leftBarButtonItem = nil
    }
    @objc func previousPage() {
        if pageControl.currentPage == 1 {
            skipButton()
        }
        let nextIndex = pageControl.currentPage - 1
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        skipButton()
        setupConstraintsForNextButtonAndCollectionView()
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: cellId)

    }
}
