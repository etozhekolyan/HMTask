//
//  File.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import Foundation

protocol TopTradersPresenterProtocol {
    init(view: TopTraidersViewControllerProtocol)
    func setupViewModel(_ response: [ResponseModel])
}

class TopTradersPresenter: TopTradersPresenterProtocol {
    var view: TopTraidersViewControllerProtocol?
    var viewModel: [ViewModel]?
    
    required init(view: TopTraidersViewControllerProtocol) {
        self.view = view
        viewModel = [ViewModel]()
    }
    
    func setupViewModel(_ response: [ResponseModel]) {
        viewModel?.removeAll(keepingCapacity: true)
        createViewModel(response)
        view?.receiveViewModel(viewModel ?? [ViewModel]() )
    }
    
    private func createViewModel(_ response: [ResponseModel]) {
        for trader in response {
            viewModel?.append(ViewModel(flag: trader.flag,
                                        name: trader.name,
                                        deposit: "$\(trader.deposit)",
                                        profit: "$\(trader.profit)"))
        }
    }
}
