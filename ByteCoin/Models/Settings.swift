//
//  Settings.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

class GlobalSetting {
    static let shared = GlobalSetting()
    let apikey = "YOUR API KEY HERE"
}

struct Routes {
    static let s = GlobalSetting.shared
    static let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
}
