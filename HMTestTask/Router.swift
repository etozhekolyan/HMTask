//
//  Router.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 23.05.2021.
//

import Foundation
import UIKit

protocol RouterProtocol {
    
}

class Router {
    
    var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController!) {
        self.navigationController = navigationController
    }
    
    func initTradeVC() {
        if let navigationController = navigationController {
            let tradeVC = SceneBuilder.buildTradeScene()
            navigationController.viewControllers = [tradeVC]
        }
    }
    
    func showTradeScene(){}
}
