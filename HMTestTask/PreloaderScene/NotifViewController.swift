//
//  NotifViewController.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 19.05.2021.
//

import UIKit
import UserNotifications

class NotifViewController: UIViewController {
    
    let preView = PreloaderView()
    var activateButton = UIButton()
    let notifications = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callNotificationRequest()
    }
    
    override func loadView() {
        super.loadView()
        self.view = preView
        configureButton(button: activateButton)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    private func callNotificationRequest() {
        notifications.requestAuthorization(options:[.badge, .alert, .sound]) { (granted, error) in

            // If granted comes true you can enabled features based on authorization.
            guard granted else { return }
        }
    }
    
    @objc func buttonHundler(sender: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
                sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    sender.transform = CGAffineTransform.identity
                }
                SceneBuilder.buildNavigarionBar()
            })
    }
    
    private func configureButton(button: UIButton) {
        button.layer.backgroundColor = UIColor(red: CGFloat(53)/CGFloat(255),
                                               green: CGFloat(185)/CGFloat(255),
                                               blue: CGFloat(114)/CGFloat(255),
                                               alpha: 1.0).cgColor
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18.0)
        button.setTitle("Activate NOW", for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(buttonHundler), for: .touchUpInside)
        self.view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 315).isActive = true
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 700).isActive = true
        button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -28).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -58).isActive = true
        
    }
}
