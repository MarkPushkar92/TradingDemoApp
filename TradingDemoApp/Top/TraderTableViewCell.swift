//
//  TraderTableViewCell.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class TraderTableViewCell: UITableViewCell {
    
    var number: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .white
        return label
    }()
    
    var countryFlag: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        return imageView
    }()
    
    var name: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .white
        return label
    }()
    
    var deposit: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .white
        label.textAlignment = .right
        return label
    }()
    
    var profit: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.backgroundColor = UIColor(red: 0.11, green: 0.122, blue: 0.176, alpha: 1)
        self.addSubviews(number, countryFlag, name, deposit, profit)
        let constraints = [
            number.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            number.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -28),
            number.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            countryFlag.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            countryFlag.widthAnchor.constraint(equalToConstant: 30),
            countryFlag.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            countryFlag.heightAnchor.constraint(equalTo: number.heightAnchor),
            
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

