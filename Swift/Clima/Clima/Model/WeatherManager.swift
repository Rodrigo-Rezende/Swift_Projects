//
//  WeatherManager.swift
//  Clima
//
//  Created by Rodrigo Rezende on 25/04/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func updateWeather(weather: WeatherModel)
}

class WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let openWeatherAPI = "https://api.openweathermap.org/data/2.5/weather?appid=8190882937273385141cf19557335c55&units=metric&"
    
    func addCityName(city: String) -> String{
        return "\(openWeatherAPI)q=\(city)"
    }
    
    func addCoordenates(lat: Double, lon: Double) -> String {
        return "\(openWeatherAPI)lat=\(lat)&lon=\(lon)"
    }
    
    func fetchInfo(urlString: String) {
        // 1. Create URL
        if let url = URL(string: urlString) {
            // 2. Create URLSession
            let session = URLSession(configuration: .default)
            // 3. Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData) {
                        self.delegate?.updateWeather(weather: weather)
                    }
                }
            }
            // 4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
//            print(decodedData.weather[0].description)
//            print(decodedData.weather[0].id)
            let weather = WeatherModel(iconId: decodedData.weather[0].id, temperature: decodedData.main.temp, cityName: decodedData.name)
            return weather
            
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
