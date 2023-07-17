//
//  TopViewController.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import UIKit

protocol TopTraidersViewControllerProtocol{
    func receiveViewModel(_ viewModel: [ViewModel])
}

class TopTraidersViewController: UIViewController, TopTraidersViewControllerProtocol {
    
    let topTraidersView = TopTradersView()
    var interactor: TopTraderInteractorProtocol?
    var viewModel: [ViewModel] = []
    var traderViewUnits: [UnitTraderView] = []
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.setupResponse()
        lunchTimer()
    }
    
    override func loadView() {
        super.loadView()
        self.view = topTraidersView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    func receiveViewModel(_ viewModel: [ViewModel]) {
        self.viewModel.removeAll(keepingCapacity: true)
        self.viewModel = viewModel
        setupTradersStack()
    }
    
    private func lunchTimer() {
        timer = Timer.scheduledTimer(timeInterval: 10,
                                     target: self,
                                     selector: #selector(timerHundler),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func timerHundler() {
        interactor?.refreshResponse()
    }
    
    private func setupTradersStack() {
        setupViews()
        if topTraidersView.traidersStackView.arrangedSubviews.count != 0 {
            topTraidersView.traidersStackView.removeFullyAllArrangedSubviews()
        }
        topTraidersView.traidersStackView.addArrangedSubview(HeadTableView(frame: .zero))
        for unitView in traderViewUnits {
            topTraidersView.traidersStackView.addArrangedSubview(unitView)
        }
    }
    
    private func setupViews() {
        traderViewUnits.removeAll(keepingCapacity: true)
        for (index, element) in viewModel.enumerated() {
            let trader = setDataForUnit(element, index)
            if index == viewModel.endIndex-1 {
                trader.isLastView = true
            }
            traderViewUnits.append(trader)
        }
    }
    
    private func setDataForUnit(_ viewModel: ViewModel, _ index: Int) -> UnitTraderView {
        let viewUnit = UnitTraderView(frame: .zero)
        viewUnit.numberLabel.text = "\(index + 1)"
        viewUnit.nameLabel.text = viewModel.name
        viewUnit.flagIcon.image = UIImage(named: viewModel.flag ?? "")
        viewUnit.depositLabel.text = viewModel.deposit
        viewUnit.profitLabel.text = viewModel.profit
        if index % 2 != 0 {
            viewUnit.backgroundColor = UIColor(red: CGFloat(48)/CGFloat(255),
                                               green: CGFloat(48)/CGFloat(255),
                                               blue: CGFloat(62)/CGFloat(255),
                                               alpha: 1.0)
        }
        
        return viewUnit
    }
}
