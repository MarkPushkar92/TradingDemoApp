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
        coordinators.append(first)
        tabBarController.viewControllers = [first.navigation]
        first.start()
     
    }
    
    

    private func topScreen() -> FirstScreenCoordinator {
        let navigation = UINavigationController()
        let coordinator = FirstScreenCoordinator(navigation: navigation, factory: factory)
        return coordinator
    }

   

}
