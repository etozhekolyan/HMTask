//
//  TimerView.swift
//  HMTestTask
//
//  Created by Nickolay Vasilchenko on 22.05.2021.
//

import UIKit

class StepView: UIView {
    
    var descriptionLabel: UILabel!
    var timerTextField: UITextField! 
    var moreTimeButton: UIButton!
    var lessTimeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        descriptionLabel = makeDescriptionLabel()
        timerTextField = makeTimerTextField()
        moreTimeButton = makeTimeButton(buttonTytpe: .addition(CGRect(x: 120, y: 28, width: 15, height: 15)))
        lessTimeButton = makeTimeButton(buttonTytpe: .lessening(CGRect(x: 16, y: 28, width: 15, height: 15)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor(red: 51/255, green: 55/255, blue: 73/255, alpha: 1.0).cgColor
        self.widthAnchor.constraint(equalToConstant: 152).isActive = true
        self.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
    private func makeDescriptionLabel() -> UILabel {
        let label = UILabel(frame: CGRect(x: 59, y: 5, width: 34, height: 15))
        label.textColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(label)
        return label
    }
    
    private func makeTimerTextField() -> UITextField {
        let textField = UITextField(frame: CGRect(x: 52, y: 27, width: 47, height: 19))
        textField.textColor = UIColor.white
        textField.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(textField)
        return textField
    }
    
    func makeTimeButton(buttonTytpe: TimeButtonType) -> UIButton {
        let button = UIButton(type: .custom)
        var iconName = ""
        switch buttonTytpe {
        case .addition(let rect):
            button.frame = rect
            iconName = "add"
        case .lessening(let rect):
            button.frame = rect
            iconName = "minus"
        }
        let image = UIImage(named: iconName)
        button.setImage(image, for: .normal)
        self.addSubview(button)
        return button
    }
    
    enum TimeButtonType {
        case addition(CGRect)
        case lessening(CGRect)
    }

}
