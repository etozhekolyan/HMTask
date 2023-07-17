//
//  TradeView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 21.05.2021.
//

import UIKit
import WebKit

class TradeView: UIView {
    
    var headLabel: UILabel!
    var balanceView: BalanceView!
    var chartWebView: WKWebView!
    var pairButton: UIButton!
    var timerView: StepView!
    var investmentView: StepView!
    
    var saleButton: UIButton!
    var buyButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        headLabel = makeHeadLabel()
        balanceView = makeBalanceView()
        chartWebView = makeWebView()
        pairButton = makePairButton()
        timerView = makeTimerView()
        investmentView = makeInvestmentView()
        
        saleButton = makeSaleButton()
        buyButton = makeBuyButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.backgroundColor = UIColor(red: CGFloat(18)/CGFloat(255),
                                       green: CGFloat(22)/CGFloat(255),
                                       blue: CGFloat(41)/CGFloat(255),
                                       alpha: 1.0)
    }
}
