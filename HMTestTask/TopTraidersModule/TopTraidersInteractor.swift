//
//  TopTraidersInteractor.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import Foundation

protocol TopTraderInteractorProtocol{
    init(presenter: TopTradersPresenterProtocol)
    func setupResponse()
    func refreshResponse()
}

class TopTraderInteractor: TopTraderInteractorProtocol {
    
    var presenter: TopTradersPresenterProtocol?
    private var multiplier: Int?
    private var responseModel: [ResponseModel]?
    var requestModel: [RequestModel] = [
        RequestModel(flag: "ireland", name: "Oliver", deposit: 2367),
        RequestModel(flag: "Russia", name: "Jack", deposit: 1175),
        RequestModel(flag: "canada", name: "Harry", deposit: 1000),
        RequestModel(flag: "brazil", name: "Jacob", deposit: 999),
        RequestModel(flag: "armenia", name: "Charley", deposit: 888),
        RequestModel(flag: "niger", name: "Thomas", deposit: 777),
        RequestModel(flag: "norway", name: "George", deposit: 666),
        RequestModel(flag: "south-korea", name: "Oscar", deposit: 555),
        RequestModel(flag: "united-kingdom", name: "James", deposit: 444),
        RequestModel(flag: "united-states", name: "William", deposit: 333)
    ]
    
    required init(presenter: TopTradersPresenterProtocol) {
        self.presenter = presenter
        multiplier = 142
        responseModel = [ResponseModel]()
    }
    
    func setupResponse() {
        createResponse()
        presenter?.setupViewModel(responseModel ?? [ResponseModel]())
    }
    
    private func createResponse() {
        for trader in requestModel {
            responseModel?.append(ResponseModel(flag: trader.flag ?? "",
                                                name: trader.name,
                                                deposit: trader.deposit,
                                                profit: (trader.deposit * (self.multiplier ?? 0))))
        }
    }
    
    func refreshResponse() {
        responseModel?.removeAll(keepingCapacity: true)
        refreshRequest()
        setupResponse()
    }
    
    private func refreshRequest() {
        let addition = Int.random(in: 50...150)
        let traderIndex = Int.random(in: 0..<requestModel.count)
        requestModel[traderIndex].deposit += addition
    }
    
}
