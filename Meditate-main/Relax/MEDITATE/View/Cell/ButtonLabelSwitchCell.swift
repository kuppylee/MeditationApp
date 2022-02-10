//
//  ButtonLabelSwitchCell.swift
//  MEDITATE
//
//  Created by Decagon Macbook Pro on 11/10/2021.
//

import UIKit

class ButtonLabelSwitchCell: UITableViewCell {
    // MARK: - ... Initializer for the class
    var buttonLabel: ButtonLabel? {
        didSet {
            blackButton.setImage(UIImage(named: buttonLabel!.buttonIcon), for: .normal)
            descriptionLabel.text = buttonLabel?.description
        }
    }
    // MARK: - ... Creating the black button in the cell
    private let blackButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.widthAnchor.constraint(equalToConstant: 48).isActive = true
        button.backgroundColor = AppColors.black.color
        button.layer.cornerRadius = 24
        return button
    }()
    // MARK: - ... Creating the description in the cell
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 17)
        return label
    }()
    // MARK: - ... Creating the black switch in the cell
    private let blackSwitch: UISwitch = {
        let blackSwitch = UISwitch()
        blackSwitch.translatesAutoresizingMaskIntoConstraints = false
        blackSwitch.heightAnchor.constraint(equalToConstant: 31).isActive = true
        blackSwitch.isUserInteractionEnabled = true
        blackSwitch.isOn = true
        blackSwitch.onTintColor = AppColors.black.color
        return blackSwitch
    }()
    // MARK: - ... Adding subviews and constraints in the cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(blackButton)
        addSubview(descriptionLabel)
        addSubview(blackSwitch)
        NSLayoutConstraint.activate([
            blackSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            blackSwitch.rightAnchor.constraint(equalTo: rightAnchor, constant: -30),
            blackButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 30),
            blackButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leftAnchor.constraint(equalTo: blackButton.rightAnchor, constant: 20),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor)

        ])
    }
    required init?(coder: NSCoder) {
       fatalError("init(code:) has not been implemented")
    }
}
