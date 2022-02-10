//
//  ContactTableViewCell.swift
//  MEDITATE
//
//  Created by  Decagon on 11/10/2021.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"
    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        titleLabel.font = UIFont(name: AppFonts.nunitoSansBold.font, size: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    var messageLabel: UILabel = {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        messageLabel.font = UIFont(name: AppFonts.nunitoSansRegular.font, size: 15)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    var firstImage: UIImageView = {
        let firstImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        firstImage.contentMode = .scaleAspectFit
        firstImage.translatesAutoresizingMaskIntoConstraints = false
        return firstImage
    }()
    var secondImage: UIImageView = {
        let secondImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        secondImage.contentMode = .scaleAspectFit
        secondImage.translatesAutoresizingMaskIntoConstraints = false
        return secondImage
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(firstImage)
        addSubview(secondImage)
        setConstriant()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setConstriant() {
        NSLayoutConstraint.activate([
            firstImage.topAnchor.constraint(equalTo: topAnchor),
            firstImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            firstImage.heightAnchor.constraint(equalToConstant: 55),
            titleLabel.leadingAnchor.constraint(equalTo: firstImage.trailingAnchor, constant: 30),
            secondImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            secondImage.heightAnchor.constraint(equalToConstant: 55),
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }

}
