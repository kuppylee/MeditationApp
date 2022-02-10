//
//  CollectionCell.swift
//  MEDITATE
//
//  Created by  Decagon on 25/09/2021.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    var page: Page? {
        didSet {
            guard let page = page else {
                return
            }
            let imageName = page.imageName
            imageView.image = UIImage(named: imageName)
            let color = UIColor(red: 0.102, green: 0.125, blue: 0.173, alpha: 1)
            let attributedText = NSMutableAttributedString(string: page.title,
                                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .medium), NSAttributedString.Key.foregroundColor: color])
attributedText.append(NSAttributedString(string: "\n\n\(page.message)",
                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .light), NSAttributedString.Key.foregroundColor: color]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.lineHeightMultiple = 0.97
     let length = attributedText.string.count
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
        }
    }
    let textView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.font = UIFont(name: "NunitoSans-Bold", size: 25)
        textView.contentInset = UIEdgeInsets(top: 23, left: 0, bottom: 0, right: 0)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    func setUpViews() {
            addSubview(textView)
            addSubview(imageView)
        imageView.anchorWithConstantsToTop(top: topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor, topConstant: 140, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.anchorWithConstantsToTop(top: imageView.bottomAnchor, left: leftAnchor,
                                          bottom: bottomAnchor,
                                          right: rightAnchor,
                                          topConstant: 0,
                                          leftConstant: 20,
                                          bottomConstant: 20, rightConstant: 20)
            textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35).isActive = true
        }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIView {
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil,
                                  bottom: NSLayoutYAxisAnchor? = nil,
                                  right: NSLayoutXAxisAnchor? = nil,
                                  topConstant: CGFloat = 0,
                                  leftConstant: CGFloat = 0,
                                  bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
    }
}
