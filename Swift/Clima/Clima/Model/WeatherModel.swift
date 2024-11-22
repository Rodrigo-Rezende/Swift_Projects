//
//  WeatherModel.swift
//  Clima
//
//  Created by Rodrigo Rezende on 01/05/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

class WeatherModel {
    
    let iconId: Int
    let temperature: Double
    let cityName: String
    
    init(iconId: Int, temperature: Double, cityName: String) {
        self.iconId = iconId
        self.temperature = temperature
        self.cityName = cityName
    }
    
    var iconName: String {
        switch iconId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"

        }
    }
    
    var displayableTemp: String {
        String(format: "%.1f", temperature)
    }
}
