//
//  ControllerFactory.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import Foundation


protocol ControllerFactory {
    func makeFirstScreen() -> (viewModel: TopScreenViewModel, controller: TopViewController)

}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeFirstScreen() -> (viewModel: TopScreenViewModel, controller: TopViewController) {
        let viewModel = TopScreenViewModel()
        let vc = TopViewController()
        return (viewModel, vc)
    }
 
}

