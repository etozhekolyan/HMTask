//
//  HeadTableView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 21.05.2021.
//

import UIKit

class HeadTableView: UIView {
    
    var numberLabel: UILabel!
    var countryLabel: UILabel!
    var nameLabel: UILabel!
    var depositLabel: UILabel!
    var profitLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        numberLabel = makeNumberLabel()
        countryLabel = makeCountryLabel()
        nameLabel = makeNameLabel()
        depositLabel = makeDepositLabel()
        profitLabel = makeProfitLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeNumberLabel() -> UILabel {
        let numLabel = baseLabel()
        numLabel.text = "№"
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 18).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.75).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        return numLabel
    }
    
    private func makeCountryLabel() -> UILabel {
        let numLabel = baseLabel()
        numLabel.text = "Country"
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 61).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 14).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        return numLabel
    }
    
    private func makeNameLabel() -> UILabel {
        let numLabel = baseLabel()
        numLabel.text = "Name"
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 67).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: 19).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        return numLabel
    }
    
    private func makeDepositLabel() -> UILabel {
        let numLabel = baseLabel()
        numLabel.text = "Deposit"
        numLabel.contentMode = .right
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 73).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 6).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        return numLabel
    }
    
    private func makeProfitLabel() -> UILabel {
        let numLabel = baseLabel()
        numLabel.text = "Profit"
        numLabel.contentMode = .right
        addSubview(numLabel)
        numLabel.widthAnchor.constraint(equalToConstant: 53).isActive = true
        numLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        numLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        numLabel.leadingAnchor.constraint(equalTo: depositLabel.trailingAnchor, constant: 19).isActive = true
        numLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.75).isActive = true
        numLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        return numLabel
    }
    
    private func baseLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: CGFloat(193)/CGFloat(255),
                                  green: CGFloat(194)/CGFloat(255),
                                  blue: CGFloat(200)/CGFloat(255),
                                  alpha: 1.0)
        return label
    }
    
    private func configureView() {
        self.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        self.backgroundColor =  UIColor(red: CGFloat(48)/CGFloat(255),
                                        green: CGFloat(48)/CGFloat(255),
                                        blue: CGFloat(62)/CGFloat(255),
                                        alpha: 1.0)
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
}
