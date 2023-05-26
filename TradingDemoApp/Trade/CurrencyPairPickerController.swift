//
//  CurrencyPairPickerController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 26.05.2023.
//

import UIKit

class CurrencyPairPickerController: UIViewController {
    
    private let viewModel: TradeViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
    
    
    

}

private extension CurrencyPairPickerController {
    func setupViews() {
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        setupNavigation()
//
//        let constraints = [
//
//
//
//        ]
//        NSLayoutConstraint.activate(constraints)
        
        
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



