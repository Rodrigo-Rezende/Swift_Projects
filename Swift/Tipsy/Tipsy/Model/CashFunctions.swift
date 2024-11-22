//
//  CashFunctions.swift
//  Tipsy
//
//  Created by Rodrigo Rezende on 23/04/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class CashFunctions {
    
    var split = Cash()
    
    let percentages = [1,1.1,1.2]
    
    func getBillTotal() -> Double {
        return split.billTotal
    }
    
    func getSplitBetween() -> Double {
        return split.splitBetween
    }
    
    func getTipAmount() -> Int {
        return split.tipAmount
    }
    
    func splitPerPerson(total: Double, amount: Int, between: Double) -> Double {
        return total * percentages[amount] / between
    }
}
