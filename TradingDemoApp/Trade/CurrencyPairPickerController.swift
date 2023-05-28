//
//  CurrencyPairPickerController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 26.05.2023.
//

import UIKit

class CurrencyPairPickerController: UIViewController {
    
    private var buttonArray: [UIButton] = []
    
    private let viewModel: TradeViewModel
    
    private var leftStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    private var rightStack: UIStackView = {
        let stack = UIStackView()
        stack.toAutoLayout()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if buttonArray.isEmpty == false {
            var currentCurrencyPair = self.viewModel.currentCurrencyPair
            let firstSpace = self.viewModel.currentCurrencyPair.index(viewModel.currentCurrencyPair.startIndex, offsetBy: 3)
            currentCurrencyPair.insert(contentsOf: " / ", at: firstSpace)
            buttonArray.first { $0.titleLabel?.text == currentCurrencyPair }?.backgroundColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        }
    }
    
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func returnToTradeScreen() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func returnWithSelectedPair(button: UIButton) {
        viewModel.chooseCurrencyPair(newPair: button.titleLabel?.text ?? "EURUSD")
        navigationController?.popToRootViewController(animated: true)
    }
    
  
}

private extension CurrencyPairPickerController {
    
    func setupViews() {
        
        viewModel.currencyOptionsArray.forEach { optionTitle in
            let currencyButton: UIButton = {
                let button = UIButton()
                button.toAutoLayout()
                button.setTitle(optionTitle, for: .normal)
                button.layer.backgroundColor = UIColor(red: 0.2, green: 0.216, blue: 0.286, alpha: 1).cgColor
                button.layer.cornerRadius = 12
                button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
                button.layer.cornerRadius = 15
                return button
            }()
            currencyButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
            currencyButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
            
            if leftStack.arrangedSubviews.count < 7 {
                leftStack.addArrangedSubview(currencyButton)
            } else {
                rightStack.addArrangedSubview(currencyButton)
            }
            currencyButton.addTarget(self, action: #selector(returnWithSelectedPair), for: .touchUpInside)
            buttonArray.append(currencyButton)
        }
        
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        view.addSubviews(leftStack, rightStack)
        setupNavigation()

        let constraints = [
            
            leftStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            leftStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            leftStack.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            leftStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            rightStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            rightStack.leadingAnchor.constraint(equalTo: leftStack.trailingAnchor),
            rightStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            rightStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),

        ]
        NSLayoutConstraint.activate(constraints)
        
    }

    func setupNavigation() {
        let barLabel: UILabel = {
            let view = UILabel()
            view.font = UIFont.systemFont(ofSize: 22, weight: .bold)
            view.textAlignment = .center
            view.text = "Currency pair"
            view.textColor = .white
            view.toAutoLayout()
            return view
        }()
        
        let returnButton: UIButton = {
            let button = UIButton()
            button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
            button.tintColor = .white
            button.toAutoLayout()
            return button
        }()
       
        navigationItem.titleView = barLabel
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: returnButton)
        returnButton.addTarget(self, action: #selector(returnToTradeScreen), for: .touchUpInside)
    }
}



