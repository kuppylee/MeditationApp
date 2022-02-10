//
//  ContactUsViewController.swift
//  MEDITATE
//
//  Created by  Decagon on 11/10/2021.
//

import UIKit

class ContactUsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomProtocol {
    let data: [ContactData] = {
        let firstContact = ContactData(firstImageName: "phone", title: "Phone", message: "+01 234567890", secondImageName: "Go-Forward")
        let secondContact = ContactData(firstImageName: "email", title: "Email", message: "support@relax.io", secondImageName: "Go-Forward")
        let thirdContact = ContactData(firstImageName: "message", title: "App Chat", message: "Average waiting time: 5min", secondImageName: "Go-Forward")
        return [firstContact, secondContact, thirdContact]
    }()
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
      label.text = " Contact Us"
      label.numberOfLines = 2
      label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 20)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    var tableView = UITableView()
    func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 100
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        configureTableView()
        setUpTableView()
    }
    @objc func goBackToTheSettingsScreen() {
        navigationController?.popViewController(animated: true)
    }
    func setUpTableView() {
        view.addSubview(tableView)
        view.addSubview(pageTitleLabel)
        view.addSubview(topBackArrowButton)
        tableView.anchorWithConstantsToTop(top: pageTitleLabel.topAnchor,
                                                left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 80, leftConstant: 0, bottomConstant: 30, rightConstant: 10)
        NSLayoutConstraint.activate([
          topBackArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
          topBackArrowButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
          pageTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
          pageTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as? ContactTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = model.title
        cell.messageLabel.text = model.message
        cell.firstImage.image = UIImage(named: model.firstImageName)
        cell.secondImage.image = UIImage(named: model.secondImageName)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellItem = data[indexPath.row]
        if cellItem.title == "Phone" {
          presentCustomAlertOnMainThread(title: cellItem.title, message: "You can just call us directly and \n we will help you.", buttonTitle: "Call Us", imageNamed: cellItem.firstImageName, arrowBtn: true)
        } else if cellItem.title == "Email" {
          presentCustomAlertOnMainThread(title: cellItem.title, message: "Just send us an email and we will \n get back to you.", buttonTitle: "Send Email", imageNamed: cellItem.firstImageName, arrowBtn: true)
        } else {
          presentCustomAlertOnMainThread(title: cellItem.title, message: "We will email you a magic link to reset your password", buttonTitle: "Start Chat", imageNamed: cellItem.firstImageName, arrowBtn: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func didTapSendLink(view: UIView) {
        view.removeFromSuperview()
    }
    @objc func didTapTopBackArrowButton() {
      navigationController?.popViewController(animated: true)
    }

}
