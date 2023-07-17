//
//  SceneBuilder.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 19.05.2021.
//

import UIKit

protocol SceneBuilderProtocol {
    static func buildPreloaderScene() -> UIViewController
    static func buildNotificationScene() -> UIViewController
}

class SceneBuilder: SceneBuilderProtocol {
    private init() {}
   static func buildPreloaderScene() -> UIViewController {
        let view = PreloaderViewController()
        return view
    }
    
    static func buildNotificationScene() -> UIViewController {
        let view = NotifViewController()
        return view
    }
    
    static func buildTopTradersScene() -> UIViewController {
        let view = TopTraidersViewController()
        let presenter = TopTradersPresenter(view: view)
        let interactor = TopTraderInteractor(presenter: presenter)
        view.interactor = interactor
        return view
    }
    
    static func buildTradeScene() -> UIViewController {
        let view = TradeViewController()
        let presenter = TradePresenter(view: view)
        let interactor = TradeInteractor(presenter: presenter)
        view.interactor = interactor
        return view 
    }
    
    static func buildNavigarionBar() {
        let tabBar = TradeTabBarController()
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController)
        router.initTradeVC()
        tabBar.viewControllers = [
            tabBar.addViewController(viewController: navigationController, title: "Trade", image: UIImage(named: "Vector")),
            tabBar.addViewController(viewController: buildTopTradersScene(), title: "Top", image: UIImage(named: "person"))
        ]
        swapRootVC(viewController: tabBar)
    }
    
    static private func swapRootVC(viewController: UIViewController) {
        guard let window = UIApplication.shared.keyWindow else { return }

        let vc = viewController

        // Set the new rootViewController of the window.
        // Calling "UIView.transition" below will animate the swap.
        window.rootViewController = vc

        // A mask of options indicating how you want to perform the animations.
        let options: UIView.AnimationOptions = .transitionCrossDissolve

        // The duration of the transition animation, measured in seconds.
        let duration: TimeInterval = 0.3

        // Creates a transition animation.
        // Though `animations` is optional, the documentation tells us that it must not be nil. ¯\_(ツ)_/¯
        UIView.transition(with: window, duration: duration, options: options, animations: {}, completion: nil)
    }
}
