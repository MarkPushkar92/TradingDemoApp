//
//  TabbarController.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    init() {
        super.init(nibName: nil, bundle: nil)
        tabBar.backgroundColor = UIColor(red: 0.125, green: 0.137, blue: 0.184, alpha: 0.8)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 0.471, green: 0.49, blue: 0.561, alpha: 1)
        UITabBar.appearance().tintColor = UIColor(red: 0.208, green: 0.725, blue: 0.447, alpha: 1)


    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
