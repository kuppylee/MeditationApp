//
//  NotificationsViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 12/10/2021.
//

import UIKit

class NotificationsViewController: UIViewController {
    let cellID = "Cell"
    var rowData: [ButtonLabel] = [ButtonLabel]()
    // MARK: - ... Creating the header
    lazy var header: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Notifications"
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
    // MARK: - ... Creating the table view to hold notification items
    lazy var notificationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isUserInteractionEnabled = true
        tableView.rowHeight = 78
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsTableView.register(ButtonLabelSwitchCell.self, forCellReuseIdentifier: cellID)
        createPreferenceArray()
        formatViews()
    }
    // MARK: - ... Adding views and constraints
    private func formatViews() {
        view.backgroundColor = AppColors.white.color
        view.addSubview(header)
        view.addSubview(backButton)
        view.addSubview(notificationsTableView)
      self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            notificationsTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30),
            notificationsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            notificationsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            notificationsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // MARK: - ... Creating the data for the arrays
    private func createPreferenceArray() {
        rowData.append(ButtonLabel(buttonIcon: "Push Alerts", description: "Push Alerts"))
        rowData.append(ButtonLabel(buttonIcon: "Daily Alerts", description: "Daily Alerts"))
        rowData.append(ButtonLabel(buttonIcon: "Promotions", description: "Promotions"))
        rowData.append(ButtonLabel(buttonIcon: "Chat Alerts", description: "Chat Alerts"))
    }
}
// MARK: - ... Creating the table view protocol stubs
extension NotificationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? ButtonLabelSwitchCell else { return UITableViewCell() }
        let item = rowData[indexPath.row]
        cell.buttonLabel = item
        cell.contentView.isUserInteractionEnabled = false
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
