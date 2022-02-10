//
//  HomeScreenViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 05/10/2021.
//

import UIKit

class HomeScreenViewController: UIViewController {

    let homeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to the Home Screen"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.white.color
        view.addSubview(homeLabel)
        homeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        homeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
