//
//  PreferenceViewController.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 11/10/2021.
//
import UIKit
class PreferenceViewController: UIViewController {
    let cellID = "Cell"
    var rowData: [ButtonLabel] = [ButtonLabel]()
    // MARK: - ... Creating the header
    lazy var header: UILabel = {
        let label = UILabel.useFontAndResize()
        label.text = "Preferences"
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
    // MARK: - ... Creating the table view to hold prefernce items
    lazy var preferenceTableView: UITableView = {
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
        preferenceTableView.register(ButtonLabelSwitchCell.self, forCellReuseIdentifier: cellID)
        createPreferenceArray()
        formatViews()
    }
    // MARK: - ... Adding subviews and constraints to the view
    private func formatViews() {
        view.backgroundColor = AppColors.white.color
        view.addSubview(header)
        view.addSubview(backButton)
        view.addSubview(preferenceTableView)
      self.navigationItem.setHidesBackButton(true, animated: true)
        NSLayoutConstraint.activate([
            header.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            header.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 73),
            preferenceTableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 30),
            preferenceTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            preferenceTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            preferenceTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // MARK: - ... Creating the data for the preferences table view
    func createPreferenceArray() {
        rowData.append(ButtonLabel(buttonIcon: "Data Analytics", description: "Data Analytics"))
        rowData.append(ButtonLabel(buttonIcon: "Newsletters", description: "Newsletters"))
    }
}
// MARK: - ... Extension for the preference table view protocol stubs
extension PreferenceViewController: UITableViewDelegate, UITableViewDataSource {
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
