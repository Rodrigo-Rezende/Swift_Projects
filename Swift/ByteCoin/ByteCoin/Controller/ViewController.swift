//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var coin = CoinManager()
    var to = "USD"
    var from = "BTC"
    
    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencySelector: UIPickerView!
    @IBOutlet weak var cryptoSelector: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coin.delegate=self
        currencySelector.delegate=self
        currencySelector.dataSource=self
        cryptoSelector.delegate=self
        cryptoSelector.dataSource=self
        // Do any additional setup after loading the view.
    }


    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == currencySelector {
            return coin.currencyArray.count
        } else {
            return coin.cryptoArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == currencySelector {
            return coin.currencyArray[row]
        } else {
            return coin.cryptoArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == currencySelector {
            to = coin.currencyArray[row]
        }
        if pickerView == cryptoSelector {
            from = coin.cryptoArray[row]
        }
        coin.fetchInfo(urlString: from, currency: to)
    }
}

extension ViewController: CoinManagerDelegate {
    func updateCoinPrice(coin: CoinModel) {
        DispatchQueue.main.async {
            self.currencyLabel.text=coin.toCurrency
            self.priceLabel.text=coin.displayableRate
            self.coinLabel.text=coin.fromCoin
        }
        
    }
    
    
}
