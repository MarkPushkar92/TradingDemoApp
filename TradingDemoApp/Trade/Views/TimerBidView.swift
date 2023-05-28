//
//  TimerBidView.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 27.05.2023.
//


import UIKit

class TimerBidView: UIView {
    
    //MARK: UI Properties
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.toAutoLayout()
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.text = "Balance"
        textField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        textField.textColor = UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1)
        textField.textAlignment = .center
        return textField
    }()
        
    let label: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textAlignment = .center
        label.text = "10 000"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.tintColor = UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1)
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.tintColor = UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1)
        button.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        return button
    }()
    
    //MARK: Methods
    
    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        self.layer.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1).cgColor
        self.layer.cornerRadius = 12

        self.addSubviews(label, textField, minusButton, plusButton)
        let constrains = [

            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 7),
            textField.widthAnchor.constraint(equalToConstant: 100),
            
            minusButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            minusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            plusButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            plusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)

        ]
        NSLayoutConstraint.activate(constrains)
        
    }
    
   
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
     
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
}



