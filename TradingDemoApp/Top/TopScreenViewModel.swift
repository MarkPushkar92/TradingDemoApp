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
    
    init() {
        topTraders = [oliver, jack, harry, jacob, charley, thomas, george, oscar, james, william]
    }
    
  //MARK: Mock traders
    
    private var oliver = Trader(name: "Oliver", country: .usa , deposit: 2367, profit: 336755)
    private var jack = Trader(name: "Jack", country: .canada, deposit: 1175, profit: 148389)
    private var harry = Trader(name: "Harry", country: .brazil, deposit: 1000, profit: 113888)
    private var jacob = Trader(name: "Jacob", country: .japan, deposit: 999, profit: 36755)
    private var charley = Trader(name: "Charley", country: .germany, deposit: 888, profit: 18389)
    private var thomas = Trader(name: "Thoms", country: .brazil, deposit: 777, profit: 12000)
    private var george = Trader(name: "George", country: .france, deposit: 666, profit: 11111)
    private var oscar = Trader(name: "Oscar", country: .newZealand, deposit: 555, profit: 9988)
    private var james = Trader(name: "James", country: .india, deposit: 444, profit: 8877)
    private var william = Trader(name: "William", country: .spain, deposit: 333, profit: 6652)
}


