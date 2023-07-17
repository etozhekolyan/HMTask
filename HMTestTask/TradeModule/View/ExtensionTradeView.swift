//
//  ExtensionTradeView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 21.05.2021.
//

import Foundation
import UIKit
import WebKit

extension TradeView {
    
    func makeHeadLabel() -> UILabel {
        let label = UILabel()
        label.text = "Trade"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 62).isActive = true
        label.widthAnchor.constraint(equalToConstant: 27).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 156).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -156).isActive = true
//        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 64).isActive = true
        return label
    }
    
    func makeBalanceView() -> BalanceView {
        let view = BalanceView()
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 315).isActive = true
        view.heightAnchor.constraint(equalToConstant: 54).isActive = true
        view.topAnchor.constraint(equalTo: headLabel.bottomAnchor, constant: 15).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        return view
    }
    
    func makeWebView() -> WKWebView {
        let webView = WKWebView(frame: .zero)
        webView.pageZoom = 3.0
        webView.layer.bounds = CGRect(x: 100, y: 50, width: 50, height: 10)
        webView.scrollView.isScrollEnabled = true
        self.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        webView.heightAnchor.constraint(equalToConstant: 321).isActive = true
        webView.topAnchor.constraint(equalTo: balanceView.bottomAnchor , constant: 25).isActive = true
        webView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        return webView
    }
    
        func makePairButton() -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.setTitle("GPD/USD", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        button.layer.backgroundColor = UIColor(red: CGFloat(51)/CGFloat(255),
                                               green: CGFloat(55)/CGFloat(255),
                                               blue: CGFloat(73)/CGFloat(255),
                                               alpha: 1.0).cgColor
        let arrowIcon = UIImageView(frame: CGRect(x: 289, y: 19, width: 7, height: 15))
        arrowIcon.image = UIImage(named: "arrow")
        button.addSubview(arrowIcon)
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 315).isActive = true
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.topAnchor.constraint(equalTo: chartWebView.bottomAnchor, constant: 16).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -236).isActive = true
        return button
    }
    
    func makeTimerView() -> StepView {
        let view = StepView(frame: .zero)
        view.descriptionLabel.text = "Timer"
        view.timerTextField.text = "00:00"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: pairButton.bottomAnchor, constant: 10).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        return view
    }
    
    func makeInvestmentView() -> StepView {
        let view = StepView(frame: .zero)
        view.descriptionLabel.frame = CGRect(x: 44, y: 5, width: 64, height: 15)
        view.descriptionLabel.text = "Investment"
        view.timerTextField.text = "1,000"
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: pairButton.bottomAnchor, constant: 10).isActive = true
        view.leadingAnchor.constraint(equalTo: timerView.trailingAnchor, constant: 11).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        return view
    }

    func makeSaleButton() -> UIButton {
        let button = makeBaseTradeButton(.red, "Sale")
        addSubview(button)
        button.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -105).isActive = true
        return button
    }
    
    func makeBuyButton() -> UIButton {
        let button = makeBaseTradeButton(.green, "Buy")
        addSubview(button)
        button.topAnchor.constraint(equalTo: investmentView.bottomAnchor, constant: 10).isActive = true
        button.leadingAnchor.constraint(equalTo: saleButton.trailingAnchor, constant: 11).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -105).isActive = true
        return button
    }
    
    
    // MARK: - Base and support UI elements
    
    private func makeBaseTradeButton(_ color: TradeButtonColor, _ title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .top
        button.titleEdgeInsets = UIEdgeInsets(top: 3.0, left: 20.0, bottom: 0.0, right: 0.0)
        button.layer.cornerRadius = 12
        switch color {
        case .green :
            button.layer.backgroundColor = UIColor(red: CGFloat(53)/CGFloat(255),
                                                   green: CGFloat(185)/CGFloat(255),
                                                   blue: CGFloat(114)/CGFloat(255),
                                                   alpha: 1.0).cgColor
        case .red :
            button.layer.backgroundColor = UIColor(red: CGFloat(254)/CGFloat(255),
                                                   green: CGFloat(61)/CGFloat(255),
                                                   blue: CGFloat(67)/CGFloat(255),
                                                   alpha: 1.0).cgColor
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 152).isActive = true
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        return button
    }
    
    private func drawArrow() -> CAShapeLayer {
        let arrowPath = UIBezierPath()
        arrowPath.move(to: CGPoint(x: 289, y: 19))
        arrowPath.addLine(to: CGPoint(x: 290, y: 30))
        arrowPath.close()
        let arrowLayer = CAShapeLayer()
        arrowLayer.path = arrowPath.cgPath
        arrowLayer.strokeColor = UIColor.white.cgColor
        return arrowLayer
    }
    
    enum TradeButtonColor {
        case green
        case red
    }
}





//func configurePairButton(_ button: UIButton) {
//    button.layer.cornerRadius = 12
//    button.setTitleColor(.white, for: .normal)
//    button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
//    button.backgroundColor = UIColor(red: 51/255, green: 55/255, blue: 73/255, alpha: 1.0)
//}
//
//func makePairButton() -> UIButton {
//    let button = UIButton()
//    configurePairButton(button)
//    button.setTitle("GPD/USD ▼", for: .normal)
//    self.addSubview(button)
//    button.translatesAutoresizingMaskIntoConstraints = false
//    button.widthAnchor.constraint(equalToConstant: 315).isActive = true
//    button.heightAnchor.constraint(equalToConstant: 54).isActive = true
//    button.topAnchor.constraint(equalTo: chartWebView.bottomAnchor, constant: 16).isActive = true
//    button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
//    button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
//    button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -236).isActive = true
//    return button
//}
