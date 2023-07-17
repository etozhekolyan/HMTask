//
//  TopTraidersView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import UIKit

class TopTradersView: UIView {
    
    var headLabel: UILabel!
    public var traidersStackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headLabel = UILabel()
        traidersStackView = UIStackView()
        configureView()
        configureLabel(headLabel)
        configureStack(traidersStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.backgroundColor = UIColor(red: CGFloat(28)/CGFloat(255),
                                       green: CGFloat(31)/CGFloat(255),
                                       blue: CGFloat(45)/CGFloat(255),
                                       alpha: 1.0)
    }
    
    private func configureLabel(_ head: UILabel) {
        head.textAlignment = .center
        head.textColor = .white
        head.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        head.text = "TOP 10 Traders"
        self.addSubview(head)
        head.translatesAutoresizingMaskIntoConstraints = false
        head.widthAnchor.constraint(equalToConstant: 165).isActive = true
        head.heightAnchor.constraint(equalToConstant: 27).isActive = true
        head.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        head.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 95).isActive = true
        head.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -95).isActive = true
        head.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -721).isActive = true
    }
    
    private func configureStack(_ stack: UIStackView) {
        stack.axis = .vertical
        stack.spacing = 0.0
        stack.distribution = UIStackView.Distribution.equalSpacing
//        stack.isBaselineRelativeArrangement = false
//        stack.isLayoutMarginsRelativeArrangement = false
        self.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: 351).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 550).isActive = true
        stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 120).isActive = true
        stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100).isActive = true
    }
}
