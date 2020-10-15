//
//  CurrencyManager.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

protocol CurrencyManagerDelegate {
    func didFailed(error: Error)
    func updateRate(currencyModel: CurrencyModel)
}

class CurrencyManager {
    
    // define some variables
    var currencyModel: CurrencyModel?
    var delegate: CurrencyManagerDelegate?
    
    // define some functions
    func checkRate(rate: String) {
        let url = Routes.baseURL + "\(rate)?apikey=\(Routes.s.apikey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, err) in
                if err != nil {
                    self.delegate?.didFailed(error: err!)
                }
                else {
                    if let safeData = data {
                        if let currency = self.fetchJSON(data: safeData) {
                            self.delegate?.updateRate(currencyModel: currency)
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
    func fetchJSON(data: Data) -> CurrencyModel? {
        
        let decoder = JSONDecoder()
        do {
            let decoded = try decoder.decode(CurrencyData.self, from: data)
            let currencyName = decoded.asset_id_quote
            let rate = decoded.rate
            self.currencyModel = CurrencyModel(currencyName: currencyName, rate: rate)
            return currencyModel
        }
        catch let jsonError as NSError {
            self.delegate?.didFailed(error: jsonError)
            return nil
        }
        
    }
    
}
