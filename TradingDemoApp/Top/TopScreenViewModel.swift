//
//  FirtsScreenViewModel.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import UIKit

protocol TopScreenOutput {
    
    var topTraders: [Trader] {get}
    
    func updateProfitAndDeposit() -> Void
}

final class TopScreenViewModel: TopScreenOutput {
    
    func updateProfitAndDeposit() {
        
    }
    
    
    var topTraders: [Trader] = []
    
  
    
    
    
    
   
}


