//
//  CurrencyModel.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct CurrencyModel {
    
    var currencyName: String?
    var rate: Double?
    
    var rateString: String {
        return String(format: "%.1f", rate!)
    }
    
}

extension CurrencyModel {
    
    func getCurrencies() -> [String] {
        return [
             "AED", "AUD", "BRL", "CAD" , "EUR", "GBP", "HKD", "IDR" , "INR", "JPY" ,"NZD", "PLN", "RUB",
             "SGD", "USD", "ZAR"
        ]
    }
    
}
