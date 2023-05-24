//
//  FirstScreenCoordinator.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class FirstScreenCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory

    private lazy var firstScreen = {
        factory.makeFirstScreen()
    }()
    

        
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        navigation.pushViewController(firstScreen.controller, animated: true)
     
    }
    
}

