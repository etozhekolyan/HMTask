//
//  BalanceView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 22.05.2021.
//

import UIKit

class BalanceView: UIView {
    
    var descriptionLabel: UILabel!
    public var balanceLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        descriptionLabel = makeDescriptionLabel()
        balanceLabel = makeBalanceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor(red: CGFloat(51)/CGFloat(255),
                                             green: CGFloat(55)/CGFloat(255),
                                             blue: CGFloat(73)/CGFloat(255),
                                             alpha: 1.0).cgColor
    }
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 134, y: 5, width: 46, height: 15))
        label.textColor = UIColor(red: CGFloat(200)/CGFloat(255),
                                  green: CGFloat(200)/CGFloat(255),
                                  blue: CGFloat(200)/CGFloat(255),
                                  alpha: 1.0)
        label.text = "Balance"
        label.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(label)
        return label
    }
    
    private func makeBalanceLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 129, y: 27, width: 57, height: 19))
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.textColor = .white
        label.text = "10 000"
        self.addSubview(label)
        return label
    }
    
}
