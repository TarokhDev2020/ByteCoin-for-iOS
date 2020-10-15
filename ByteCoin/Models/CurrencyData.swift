//
//  CurrencyData.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct CurrencyData: Codable {
    
    // define some variables
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
    
}
