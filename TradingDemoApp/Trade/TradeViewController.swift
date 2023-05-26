//
//  TradeViewController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class TradeViewController: UIViewController {
    
    private let tradeView = TradeView()
    
    private let url = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = .white
        view.layer.backgroundColor = UIColor(red: 0.071, green: 0.086, blue: 0.161, alpha: 1).cgColor
    }
    
    private func applyData() {
        DispatchQueue.main.async {
            self.tradeView.webView.load(URLRequest(url: URL(string: self.url)!))
        }
    }


}

private extension TradeViewController {
    func setupViews() {
        view.addSubview(tradeView)
       // applyData()
        let constraints = [
            
            tradeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tradeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tradeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tradeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }

}
