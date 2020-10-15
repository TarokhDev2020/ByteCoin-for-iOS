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
    let apikey = "BD624E9B-7874-43C5-84F0-43AA9EA7935A"
}

struct Routes {
    static let s = GlobalSetting.shared
    static let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
}
