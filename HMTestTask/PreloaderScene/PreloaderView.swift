//
//  PreloaderView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 19.05.2021.
//

import UIKit

typealias Position = (top: CGFloat, botton: CGFloat, leading: CGFloat, trailing: CGFloat)

class PreloaderView: UIView {
    
    var greenEllipse = UIView()
    var redEllipse = UIView()
    var blurView = UIVisualEffectView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureEllipse(view: greenEllipse, position: (193, -496, 231, -21), color: UIColor(red: CGFloat(53)/CGFloat(255),
                                                                                            green: CGFloat(185)/CGFloat(255),
                                                                                            blue: CGFloat(114)/CGFloat(255),
                                                                                            alpha: 1.0).cgColor)
        configureEllipse(view: redEllipse, position: (462, -227, 20, -232), color: UIColor(red: CGFloat(255)/CGFloat(255),
                                                                                            green: CGFloat(97)/CGFloat(255),
                                                                                            blue: CGFloat(81)/CGFloat(255),
                                                                                            alpha: 1.0).cgColor)
        configureBlurView(blurView: blurView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.layer.backgroundColor = UIColor(red: CGFloat(28)/CGFloat(255),
                                             green: CGFloat(41)/CGFloat(255),
                                             blue: CGFloat(45)/CGFloat(255),
                                             alpha: 1.0).cgColor
    }

    private func configureEllipse(view: UIView, position: Position, color: CGColor) {
        view.frame.size = CGSize(width: 123, height: 123)
        view.layer.cornerRadius = view.frame.size.width / 2.0
        view.clipsToBounds = false
        view.layer.backgroundColor = color
        view.layer.shadowColor = color
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 50
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: position.top).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: position.leading).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: position.trailing).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: position.botton).isActive = true
    }
    
    private func configureBlurView(blurView: UIVisualEffectView) {
        blurView.effect = UIBlurEffect(style: .dark)
        self.addSubview(blurView)
        blurView.translatesAutoresizingMaskIntoConstraints = false
//        blurView.widthAnchor.constraint(equalToConstant: 334).isActive = true
//        blurView.heightAnchor.constraint(equalToConstant: 392).isActive = true
//        blurView.topAnchor.constraint(equalTo: self.topAnchor, constant: 193).isActive = true
//        blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -227).isActive = true
        
        blurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
