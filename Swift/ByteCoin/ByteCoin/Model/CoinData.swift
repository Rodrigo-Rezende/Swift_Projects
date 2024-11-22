//
//  CoinData.swift
//  ByteCoin
//
//  Created by Rodrigo Rezende on 09/05/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}

//struct Rates: Codable {
//    let time: String
//    let asset_id_quote: String
//    let rate: Double
//}