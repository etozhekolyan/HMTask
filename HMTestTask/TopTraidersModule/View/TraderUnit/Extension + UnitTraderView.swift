//
//  Extension + UnitTraderView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 21.05.2021.
//

import UIKit

extension UnitTraderView {
    
    func makeNumberLabel() -> UILabel {
        let numLabel = makeBaseLabel(14, color: UIColor(red: CGFloat(193)/CGFloat(255),
                                                        green: CGFloat(194)/CGFloat(255),
                                                        blue: CGFloat(200)/CGFloat(255),
                                                        alpha: 1.0))
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 28).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 14).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.75).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14).isActive = true
        return numLabel
    }
    
    func makeFlagImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 26.24).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 17.19).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        imageView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 4).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16).isActive = true
        return imageView
    }
    
    func makeNameLabel() -> UILabel {
        let nameLabel = makeBaseLabel(14, color: UIColor.white)
        addSubview(nameLabel)
        nameLabel.widthAnchor.constraint(equalToConstant: 67).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: flagIcon.trailingAnchor, constant: 42).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        return nameLabel
    }
    
    func makeDepositLabel() -> UILabel {
        let depLabel = makeBaseLabel(14, color: UIColor.white)
        addSubview(depLabel)
        depLabel.widthAnchor.constraint(equalToConstant: 61).isActive = true
        depLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        depLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        depLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 14).isActive = true
        depLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        return depLabel
    }
    
    func makeProfitLabel() -> UILabel {
        let depLabel = makeBaseLabel(14, color: UIColor(red: CGFloat(53)/CGFloat(255),
                                                        green: CGFloat(185)/CGFloat(255),
                                                        blue: CGFloat(114)/CGFloat(255),
                                                        alpha: 1.0))
        addSubview(depLabel)
        depLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        depLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        depLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        depLabel.leadingAnchor.constraint(equalTo: depositLabel.trailingAnchor, constant: 14).isActive = true
        depLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        depLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        return depLabel
    }
    
    private func makeBaseLabel(_ size: CGFloat, color: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: size)
        return label
    }
}

extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}
