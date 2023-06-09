//
//  TradeView.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 26.05.2023.
//

import UIKit
import WebKit

class TradeView: UIView {
    
    //MARK: UI Properties
    
    private var tradeLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textAlignment = .center
        label.text = "Trade"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let balanceView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1).cgColor
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let balanceTextLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textAlignment = .center
        label.text = "Balance"
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(red: 0.784, green: 0.784, blue: 0.784, alpha: 1)
        label.textAlignment = .center
        return label
    }()
        
    let balanceLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textAlignment = .center
        label.text = "10 000"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let webView: WKWebView = {
        let webView = WKWebView()
        webView.toAutoLayout()
        return webView
    }()
    
    let currencyButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.layer.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1).cgColor
        button.layer.cornerRadius = 12
        button.setTitle("GPB/USD", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        button.layer.cornerRadius = 15
        return button
    }()

    private let imageChevron: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.toAutoLayout()
        return imageView
    }()

    let timerView: TimerBidView = {
        let timerView = TimerBidView()
        timerView.label.text = "Timer"
        timerView.textField.text = "00:00"
        timerView.textField.placeholder = "Set timer"
        return timerView
    }()

    let bidView: TimerBidView = {
        let bidView = TimerBidView()
        bidView.label.text = "Investment"
        bidView.textField.text = "1,000"
        bidView.textField.placeholder = "Set bid"
        return bidView
    }()

    let sellButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = UIColor(red: 0.996, green: 0.239, blue: 0.263, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("  Sell", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.cornerRadius = 15
        return button
    }()

    let buyButton: UIButton = {
        let button = UIButton()
        button.toAutoLayout()
        button.backgroundColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitle("  Buy", for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        button.layer.cornerRadius = 15
        return button
    }()
    
    //MARK: Methods
    
    private func setupViews() {
        self.toAutoLayout()
        self.backgroundColor = .white
        self.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        self.addSubviews(tradeLabel, balanceView, balanceTextLabel, balanceLabel, webView, currencyButton, imageChevron, timerView, bidView, sellButton, buyButton)
        
        self.addSubviews(tradeLabel, balanceView, balanceTextLabel, balanceLabel, webView)
        
        
        let constrains = [

            tradeLabel.topAnchor.constraint(equalTo: self.topAnchor),
            tradeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            balanceView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            balanceView.widthAnchor.constraint(equalToConstant: 315),
            balanceView.heightAnchor.constraint(equalToConstant: 54),
            balanceView.topAnchor.constraint(equalTo: tradeLabel.bottomAnchor, constant: 15),
            
            balanceTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            balanceTextLabel.topAnchor.constraint(equalTo: balanceView.topAnchor, constant: 5),

            balanceLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            balanceLabel.topAnchor.constraint(equalTo: balanceTextLabel.bottomAnchor, constant: 7),
            
            webView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            webView.topAnchor.constraint(equalTo: balanceView.bottomAnchor, constant: 25),
            webView.heightAnchor.constraint(equalToConstant: 320),
            
            currencyButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            currencyButton.widthAnchor.constraint(equalToConstant: 315),
            currencyButton.heightAnchor.constraint(equalToConstant: 54),
            currencyButton.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),

            imageChevron.centerYAnchor.constraint(equalTo: currencyButton.centerYAnchor),
            imageChevron.heightAnchor.constraint(equalToConstant: 15),
            imageChevron.widthAnchor.constraint(equalToConstant: 7),
            imageChevron.trailingAnchor.constraint(equalTo: currencyButton.trailingAnchor, constant: -18),

            timerView.leadingAnchor.constraint(equalTo: currencyButton.leadingAnchor),
            timerView.topAnchor.constraint(equalTo: currencyButton.bottomAnchor, constant: 10),
            timerView.widthAnchor.constraint(equalToConstant: 150),
            timerView.heightAnchor.constraint(equalToConstant: 54),

            bidView.trailingAnchor.constraint(equalTo: currencyButton.trailingAnchor),
            bidView.topAnchor.constraint(equalTo: currencyButton.bottomAnchor, constant: 10),
            bidView.widthAnchor.constraint(equalToConstant: 150),
            bidView.heightAnchor.constraint(equalToConstant: 54),

            sellButton.leadingAnchor.constraint(equalTo: currencyButton.leadingAnchor),
            sellButton.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            sellButton.widthAnchor.constraint(equalToConstant: 150),
            sellButton.heightAnchor.constraint(equalToConstant: 54),

            buyButton.trailingAnchor.constraint(equalTo: currencyButton.trailingAnchor),
            buyButton.topAnchor.constraint(equalTo: bidView.bottomAnchor, constant: 10),
            buyButton.widthAnchor.constraint(equalToConstant: 150),
            buyButton.heightAnchor.constraint(equalToConstant: 54),

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



