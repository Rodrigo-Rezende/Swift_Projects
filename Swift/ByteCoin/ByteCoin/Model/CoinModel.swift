//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Rodrigo Rezende on 09/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    
    var fromAssetID : String
    var toAssetID: String
    var rate: Double
    
    init(fromAssetID: String, toAssetID: String, rate: Double) {
        self.fromAssetID = fromAssetID
        self.toAssetID = toAssetID
        self.rate = rate
    }
    
    var displayableRate: String {
        return String(format: "%.2f", rate)
    }
    
    var fromCoin: String {
        return fromAssetID
    }
    
    var toCurrency : String {
        return toAssetID
    }
    
}
