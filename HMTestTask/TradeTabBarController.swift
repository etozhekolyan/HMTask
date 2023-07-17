//
//  TradeTabBarControllerViewController.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 20.05.2021.
//

import UIKit

class TradeTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    public func addViewController(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func configureTabBar() {
        self.tabBar.layer.backgroundColor = UIColor(red: CGFloat(46)/CGFloat(255),
                                                    green: CGFloat(50)/CGFloat(255),
                                                    blue: CGFloat(65)/CGFloat(255),
                                                    alpha: 1.0).cgColor
        self.tabBar.tintColor = UIColor(red: CGFloat(53)/CGFloat(255),
                                        green: CGFloat(185)/CGFloat(255),
                                        blue: CGFloat(114)/CGFloat(255),
                                        alpha: 1.0)
        self.tabBar.unselectedItemTintColor = UIColor(red: CGFloat(120)/CGFloat(255),
                                                      green: CGFloat(125)/CGFloat(255),
                                                      blue: CGFloat(143)/CGFloat(255),
                                                      alpha: 1.0)
    }
}
