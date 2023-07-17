//
//  UnitTraderView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 21.05.2021.
//

import UIKit

class UnitTraderView: UIView {
    
    var numberLabel: UILabel!
    var flagIcon: UIImageView!
    var nameLabel: UILabel!
    var depositLabel: UILabel!
    var profitLabel: UILabel!
    public var isLastView: Bool! {
        didSet{
            roundLastView()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        numberLabel = makeNumberLabel()
        flagIcon = makeFlagImageView()
        nameLabel = makeNameLabel()
        depositLabel = makeDepositLabel()
        profitLabel = makeProfitLabel()
        isLastView = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.widthAnchor.constraint(equalToConstant: 350).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.backgroundColor = UIColor(red: CGFloat(28)/CGFloat(255),
                                       green: CGFloat(31)/CGFloat(255),
                                       blue: CGFloat(45)/CGFloat(255),
                                       alpha: 1.0)
    }
    
    private func roundLastView() {
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
