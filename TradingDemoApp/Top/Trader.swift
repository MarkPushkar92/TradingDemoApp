//
//  Trader.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import Foundation
import UIKit

struct Trader {
    let name: String
    let country: Country
    var deposit: Int
    var profit: Int
  
    var flag: UIImage? {
        UIImage(named: country.rawValue)
    }
    
    enum Country: String {
        case usa
        case canada
        case brazil
        case japan
        case germany
        case france
        case newZealand
        case spain
        case india
    }
}
