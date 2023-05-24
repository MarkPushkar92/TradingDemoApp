//
//  MainCoordinator.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let tabBarController: TabBarViewController
    private let factory = ControllerFactoryImpl()
  
    init() {
        tabBarController = TabBarViewController()
        let first = topScreen()
        let second = tradeScreen()
        coordinators.append(first)
        coordinators.append(second)
        tabBarController.viewControllers = [second.navigation, first.navigation]
        first.start()
        second.start()
     
    }
    
    private func topScreen() -> FirstScreenCoordinator {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "Top", image: UIImage(named: "top"), tag: 0)
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }
    
    private func tradeScreen() -> SecondScreenCoordinator {
        let navigation = UINavigationController()
        navigation.tabBarItem = UITabBarItem(title: "Trade", image: UIImage(named: "trade"), tag: 0)

        let coordinator = SecondScreenCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }

   

}
