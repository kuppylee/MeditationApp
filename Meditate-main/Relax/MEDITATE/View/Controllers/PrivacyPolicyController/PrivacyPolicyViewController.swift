//
//  PrivacyPolicyViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 12/10/2021.
//

import UIKit
import WebKit

class PrivacyPolicyViewController: UIViewController {
    // MARK: - ... Creating the View Header
    lazy var header: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Privacy Policy"
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 22)
        return label
    }()
    // MARK: - ... Creating the back button
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(AppButtonImages.goBackButton.image, for: .normal)
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        button.addTarget(self, action: #selector(goBackToSettingsScreen), for: .touchUpInside)
        return button
    }()
    @objc func goBackToSettingsScreen() {
        navigationController?.popViewController(animated: true)
    }
    let paragraphOne = "Here you can put any of your text that you would like to be displayed here. It can be any text that you think would be suitable.\n\n\n"
    let paragraphTwo = "You can insert your already existing privacy policy or create a new one and put it here as well."
    let paraTwoExt = "It is entirely up to you and you can use any text that you think would be suitable for this app screen.\n\n\n"
    let paragraphThree = "You can also use this part of the screen to put your text in if you want to do that "
    let paraThreeExt = "but it is entirely up to you because you can put any text that would be suitable here.\n\n\n"
    let paragraphFour = "This is where all the text content supposed to end but you can add more text down below.\n\n\n"
    // MARK: - ... Creating the text View to hold the policies
    lazy var privacyPolicyText: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
        textView.text = paragraphOne + paragraphTwo + paraTwoExt + paragraphThree + paraThreeExt + paragraphFour
        return textView
    }()
    // MARK: - ... Creating the button to accept policies
    lazy var acceptButton: UIButton = {
        let button = UIButton.makeBlackAndRounded()
        button.setTitle("Accept", for: .normal)
        button.isEnabled = true
        return button
    }()
    // MARK: - ... Creating the button to decline policies
    lazy var declineButton: UIButton = {
        let button = UIButton.makeBlackAndRounded()
        button.backgroundColor = AppColors.white.color
        button.layer.borderWidth = 1
        button.setTitle("Decline", for: .normal)
        button.setTitleColor(AppColors.black.color, for: .normal)
        button.isEnabled = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
    }

    // MARK: - ... Adding subviews to the view
    private func addSubviews() {
        view.backgroundColor = AppColors.white.color
        view.addSubview(header)
        view.addSubview(backButton)
        view.addSubview(acceptButton)
        view.addSubview(declineButton)
        view.addSubview(privacyPolicyText)
    }
    // MARK: - ... Adding constraints to subviews
    private func addConstraints() {
      self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            acceptButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            acceptButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            acceptButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            declineButton.bottomAnchor.constraint(equalTo: acceptButton.topAnchor, constant: -15),
            declineButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            declineButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            privacyPolicyText.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30),
            privacyPolicyText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            privacyPolicyText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            privacyPolicyText.bottomAnchor.constraint(equalTo: declineButton.topAnchor, constant: -60)
        ])
    }
}
