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
    
    private let preloader = PreLoaderController()
            
    init(navigation: UINavigationController,factory: ControllerFactory) {
        self.navigation = navigation
        self.factory = factory
    }
    
    func start() {
        navigation.pushViewController(preloader, animated: true)
        preloader.goFurther = {
            self.requestNotifications()
        }
//        navigation.pushViewController(firstScreen.controller, animated: true)
     
    }
    
    func requestNotifications() {
        
        print( "yo ")
        
   
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [self] success, error in
            if success {
                print("All set!")
                DispatchQueue.main.async {
                    navigation.pushViewController(firstScreen.controller, animated: true)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}



