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
    let country: String
    var deposit: Int
    var profit: Int
  
    var flag: UIImage? {
        UIImage(named: country)
    }
    
    enum Country {
        case usa
        case canada
        case brazil
        case japan
        case germany
        case france
        case newZeland
        case spain
        case india
    }
}
