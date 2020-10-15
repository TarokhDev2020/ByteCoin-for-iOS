//
//  ViewController.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import MBProgressHUD

class ByteCoinViewController: UIViewController {
    
    
    //MARK: - @IBOutlets
    @IBOutlet var byteCoinLabel: UILabel!
    @IBOutlet var bitcoinImageView: UIImageView!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var currencyPickerView: UIPickerView!
    @IBOutlet var currencyStackView: UIStackView!
    
    
    //MARK: - Variables
    var currencyManager = CurrencyManager()
    var currencyModel = CurrencyModel()
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currencyStackView.addBackground(color: UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 0.30))
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        currencyManager.delegate = self
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        
        currencyManager.checkRate(rate: "AED")
    }
    

}

//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension ByteCoinViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyModel.getCurrencies().count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyModel.getCurrencies()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currencyItem = currencyModel.getCurrencies()[row]
        self.currencyManager.checkRate(rate: currencyItem)
    }
    
}

//MARK: - CurrencyManagerDelegate
extension ByteCoinViewController: CurrencyManagerDelegate {
    
    func didFailed(error: Error) {
        print(error.localizedDescription)
    }
    
    func updateRate(currencyModel: CurrencyModel) {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.rateLabel.text = currencyModel.rateString
            self.currencyLabel.text = currencyModel.currencyName
        }
    }
    
}
