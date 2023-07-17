//
//  TradePresenter.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 23.05.2021.
//

import Foundation

protocol TradePresenterProtocol {
    func setupViewModel(response: ResponseData)
}

class TradePresenter: TradePresenterProtocol {
    
    var view: TradeViewControllerProtocol?
    
    init(view: TradeViewControllerProtocol? = nil) {
        self.view = view
    }
    
    func setupViewModel(response: ResponseData) {
        view?.getViewModel(viewModel: ViewModelData(balance: String(response.balance),
                                                    time: String(response.time ?? 0),
                                                    investment: String(response.investment ?? 0),
                                                    HTMLContent: response.HTMLContent ?? "",
                                                    url: response.url))
    }
}
