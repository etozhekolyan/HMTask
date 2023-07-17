//
//  TradeViewController.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import UIKit

protocol TradeViewControllerProtocol{
    func getViewModel(viewModel: ViewModelData)
}

class TradeViewController: UIViewController, TradeViewControllerProtocol {
    
    var tradeView: TradeView!
    var interactor: TradeInteractorProtocol?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tradeView = TradeView(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.setupRequset()
    }
    
    override func loadView() {
        super.loadView()
        self.view = tradeView
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    func getViewModel(viewModel: ViewModelData) {
        tradeView.balanceView.balanceLabel.text = viewModel.balance
        tradeView.timerView.timerTextField.text = viewModel.time
        tradeView.investmentView.timerTextField.text = viewModel.investment
        tradeView.chartWebView.loadHTMLString(viewModel.HTMLContent ?? "", baseURL: viewModel.url)
    }
}
