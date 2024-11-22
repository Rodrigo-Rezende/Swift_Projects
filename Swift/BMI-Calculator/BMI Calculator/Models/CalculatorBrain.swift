//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Rodrigo Rezende on 22/04/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    func calculate(height: Float, weight: Float) -> Float {
        return weight / pow(height, 2)
    }
    
    

}
