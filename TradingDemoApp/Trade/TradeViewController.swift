//
//  TradeViewController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit


class TradeViewController: UIViewController {
    
    weak var coordinator: SecondScreenCoordinator?
    
    private let viewModel: TradeViewModel
    
    private let tradeView = TradeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        tradeView.currencyButton.addTarget(self, action: #selector(pickNewCurrencyPair), for: .touchUpInside)
        
    }
    
    init(viewModel: TradeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func pickNewCurrencyPair() {
        viewModel.onTapShowNextModule()
    }
    
    
    private func applyData() {
        DispatchQueue.main.async {
            self.tradeView.webView.load(URLRequest(url: URL(string: self.viewModel.urlStr)!))
            
        }
    }


}

private extension TradeViewController {
    func setupViews() {
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
        view.addSubview(tradeView)
        applyData()
        let constraints = [
            
            tradeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tradeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tradeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tradeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    
    
    
    
}
