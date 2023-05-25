//
//  TopTradersHeader.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 25.05.2023.
//

import UIKit

class TopTradersHeader: UITableViewHeaderFooterView {
    
    private var number: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "№"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        return label
    }()
    
    private var country: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Country"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        return label
    }()
    
    private var name: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        return label
    }()
    
    private var deposit: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Deposit"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    private var profit: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.text = "Profit"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(red: 0.757, green: 0.761, blue: 0.784, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
 
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubviews(number, country, name, deposit, profit)
        let constraints = [
            number.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            number.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -28),
            number.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            country.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            country.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            country.heightAnchor.constraint(equalTo: number.heightAnchor),
            
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 110),
            name.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            name.widthAnchor.constraint(equalToConstant: 70),

            deposit.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 20),
            deposit.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            deposit.widthAnchor.constraint(equalToConstant: 60),

            profit.widthAnchor.constraint(equalToConstant: 75),
            profit.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            profit.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)

        }
}


 

