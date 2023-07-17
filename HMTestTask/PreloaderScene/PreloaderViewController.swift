//
//  ViewController.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 19.05.2021.
//

import UIKit
import Foundation

class PreloaderViewController: UIViewController {
    
    let progressBar = ALProgressBar()
    let preView = PreloaderView()
    var timer = Timer()
    var progressStep: Float = (0.1 / 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        lunchLoading()
    }
    override func loadView() {
         super.loadView()
        self.view = preView
        configureProgressBar(progressBar: progressBar)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    private func lunchLoading() {
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerHundler),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc func timerHundler() {
        if progressBar.progress != 1.0 {
            progressStep += 0.5
            progressBar.setProgress(progressStep, animated: true)
            progressBar.setStatus(status: getProgressAsPersentages(progress: progressBar.progress))
        } else if progressBar.progress == 1.0 {
            timer.invalidate()
            swapRootVC(viewController: SceneBuilder.buildNotificationScene())
        }
    }
    
    private func getProgressAsPersentages(progress: CGFloat) -> String {
        let percent: Int = Int((progress * 100))
        return String(percent)
    }
    
    private func configureProgressBar(progressBar: ALProgressBar) {
        progressBar.startColor = UIColor(red: CGFloat(53)/CGFloat(255),
                                         green: CGFloat(185)/CGFloat(255),
                                         blue: CGFloat(114)/CGFloat(255),
                                         alpha: 1.0)
        progressBar.endColor = UIColor(red: CGFloat(55)/CGFloat(255),
                                         green: CGFloat(183)/CGFloat(255),
                                         blue: CGFloat(114)/CGFloat(255),
                                         alpha: 1.0)
        progressBar.grooveColor = UIColor(red: CGFloat(91)/CGFloat(255),
                                         green: CGFloat(90)/CGFloat(255),
                                         blue: CGFloat(96)/CGFloat(255),
                                         alpha: 1.0)
        self.view.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.widthAnchor.constraint(equalToConstant: 201).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 24).isActive = true
        progressBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 394).isActive = true
        progressBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 37).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -38).isActive = true
        progressBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -394).isActive = true
    }
    
    private func swapRootVC(viewController: UIViewController) {
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

