//
//  SecondScreenCoordinator.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

class SecondScreenCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let navigation: UINavigationController
    let factory: ControllerFactory

    private lazy var secondScreen = {
        factory.makeSecondScreen()
    }()
    

        
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        secondScreen.viewModel.showCurrencyPairPicker = {
            self.goToCurrencyChangeScreen()
        }
        navigation.pushViewController(secondScreen.controller, animated: true)
     
    }
    
    func goToCurrencyChangeScreen() {
        navigation.pushViewController(CurrencyPairPickerController(viewModel: secondScreen.viewModel), animated: true)
    }
    
}
