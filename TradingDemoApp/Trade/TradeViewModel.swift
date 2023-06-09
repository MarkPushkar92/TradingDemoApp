//
//  TradeViewModel.swift
//  TradingDemoApp
//
//  Created by Марк Пушкарь on 24.05.2023.
//

import Foundation

import UIKit

protocol TradeOutput {
    
    var currencyOptionsArray: [String] { get }
    
    var currentCurrencyPair: String { get }
    
    func chooseCurrencyPair(newPair: String) -> ()
    
    func buy(bid: Int) -> ()
    
    var onTapShowNextModule: () -> Void { get }
    
    func getURL() -> String
    
}

final class TradeViewModel: TradeOutput {
    
    var balance: Int = 10000
    
    var currencyOptionsArray = ["EUR / USD","EUR / USD", "EUR / USD","EUR / USD","EUR / USD",  "GBP / USD", "EUR / USD", "EUR / USD", "EUR / USD", "EUR / USD",  "GBP / USD",  "GBP / USD",  "GBP / USD",  "GBP / USD"]
    
    var currentCurrencyPair = "GBPUSD"
    
    func chooseCurrencyPair(newPair: String)  {
        currentCurrencyPair = newPair.replacingOccurrences(of: " / ", with: "")
    }
    
    func buy(bid: Int) {
        balance -= bid
        let randomResult = Bool.random()
        if randomResult {
            balance += Int(Double(bid) * 1.7)
        } else {
            return
        }
    }
    
    var showCurrencyPairPicker: (() -> Void)?

    lazy var onTapShowNextModule: () -> Void = { [weak self] in
        self?.showCurrencyPairPicker!()
    }
    
    func getURL() -> String {
        let pair = currentCurrencyPair
        return "https://s.tradingview.com/embed-widget/symbol-overview/?locale=en#%7B%22symbols%22%3A%5B%5B%22FX%3A\(pair)%7C1D%22%5D%5D%2C%22chartOnly%22%3Afalse%2C%22width%22%3A1000%2C%22height%22%3A500%2C%22colorTheme%22%3A%22dark%22%2C%22showVolume%22%3Afalse%2C%22showMA%22%3Afalse%2C%22hideDateRanges%22%3Afalse%2C%22hideMarketStatus%22%3Afalse%2C%22hideSymbolLogo%22%3Afalse%2C%22scalePosition%22%3A%22right%22%2C%22scaleMode%22%3A%22Normal%22%2C%22fontFamily%22%3A%22-apple-system%2C%20BlinkMacSystemFont%2C%20Trebuchet%20MS%2C%20Roboto%2C%20Ubuntu%2C%20sans-serif%22%2C%22fontSize%22%3A%2210%22%2C%22noTimeScale%22%3Afalse%2C%22valuesTracking%22%3A%221%22%2C%22changeMode%22%3A%22price-and-percent%22%2C%22chartType%22%3A%22area%22%2C%22maLineColor%22%3A%22%232962FF%22%2C%22maLineWidth%22%3A1%2C%22maLength%22%3A9%2C%22lineWidth%22%3A2%2C%22lineType%22%3A0%2C%22dateRanges%22%3A%5B%221d%7C1%22%2C%221m%7C30%22%2C%223m%7C60%22%2C%2212m%7C1D%22%2C%2260m%7C1W%22%2C%22all%7C1M%22%5D%2C%22utm_source%22%3A%22www.tradingview.com%22%2C%22utm_medium%22%3A%22widget_new%22%2C%22utm_campaign%22%3A%22symbol-overview%22%2C%22page-uri%22%3A%22www.tradingview.com%2Fwidget%2Fsymbol-overview%2F%22%7D"
    }
    
}
