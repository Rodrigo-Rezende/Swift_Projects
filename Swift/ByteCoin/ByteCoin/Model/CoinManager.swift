//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func updateCoinPrice(coin: CoinModel)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
    let apiKey = "APIKEY-250CAA18-96E2-4901-9462-4417B3C304EA"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let cryptoArray = ["BTC", "ETH", "BNB", "XRP", "DOGE", "USDT", "SOL", "ADA", "USDC"]

    func fetchInfo(urlString: String, currency: String) {
        let joinedURL = baseURL+urlString+"/"+currency+"/"+apiKey
//        print(joinedURL)
        // 1. Create URL
        if let url = URL(string: joinedURL) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let coin = self.parseJSON(coinData: safeData, currency: currency) {
                        self.delegate?.updateCoinPrice(coin: coin)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(coinData: Data, currency: String) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let coin = CoinModel(fromAssetID: decodedData.asset_id_base, toAssetID: decodedData.asset_id_quote, rate: decodedData.rate)
            print(coin)
            return coin
        } catch {
            print(error)
            return nil
        }
    }
    
//    func getPriceFromCurrency(rates: Double, currency: String) -> CoinModel {
//        for entry in rates {
//            if entry.asset_id_quote == currency {
//                return CoinModel(assetID: entry.asset_id_quote, rate: entry.rate)
//            }
//        }
//        return CoinModel(assetID: asset_id_quote, rate: )
//        return CoinModel(assetID: "None", rate: 0.0)
//    }
    
}
