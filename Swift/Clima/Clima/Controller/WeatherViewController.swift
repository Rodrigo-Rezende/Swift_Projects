//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController {
    
    var weather = WeatherManager()
    var location = CLLocationManager()

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location.requestWhenInUseAuthorization()
        location.delegate=self
        location.requestLocation()
        searchTextField.delegate = self
        weather.delegate = self
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {
    @IBAction func searchButtonPress(_ sender: UIButton) {
        weather.fetchInfo(urlString: weather.addCityName(city: searchTextField.text!))
        searchTextField.endEditing(true)
    }
    
    @IBAction func currentLocationButtonPress(_ sender: UIButton) {
        location.requestLocation()
//        weather.fetchInfo(urlString: weather.addCoordenates(lat: location.location?.coordinate.latitude ?? 0.0, lon: location.location?.coordinate.longitude ?? 0.0))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "No location specified"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
    func updateWeather(weather: WeatherModel){
        DispatchQueue.main.async {
            self.temperatureLabel.text=weather.displayableTemp
            self.conditionImageView.image=UIImage(systemName: weather.iconName)
            self.cityLabel.text=weather.cityName
        }
//        print(weather.displayableTemp)
    }
}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordenates = locations.last {
            location.stopUpdatingLocation()
            let lat = coordenates.coordinate.latitude
            let lon = coordenates.coordinate.longitude
            weather.fetchInfo(urlString: weather.addCoordenates(lat: lat, lon: lon))
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Failed with \(error)")
    }
}
