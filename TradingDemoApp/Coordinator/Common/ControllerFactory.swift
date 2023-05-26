//
//  ControllerFactory.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import Foundation


protocol ControllerFactory {
    
    func makeFirstScreen() -> (viewModel: TopScreenViewModel, controller: TopViewController)
    
    func makeSecondScreen() -> (viewModel: TradeViewModel, controller: TradeViewController) 


}

struct ControllerFactoryImpl: ControllerFactory {
    
    func makeFirstScreen() -> (viewModel: TopScreenViewModel, controller: TopViewController) {
        let viewModel = TopScreenViewModel()
        let vc = TopViewController(viewModel: viewModel)
        return (viewModel, vc)
    }
    
    func makeSecondScreen() -> (viewModel: TradeViewModel, controller: TradeViewController) {
        let viewModel = TradeViewModel()
        let vc = TradeViewController(viewModel: viewModel)
        return (viewModel, vc)
    }
 
}

