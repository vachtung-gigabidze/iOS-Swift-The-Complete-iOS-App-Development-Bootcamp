//
//  WeatherManager.swift
//  Clima
//
//  Created by Дмирий Зядик on 07.10.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let apiKey = ""
    var weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\("apiKey")&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(wuth: urlString)
    }
    
    func fetchWeather(_ lat: CLLocationDegrees , _ lon: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(wuth: urlString)
    }
    
    func performRequest(wuth urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        
                        delegate?.didUpdateWeather(self ,weather: weather)
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return  weather
            //print(weather.conditionName)
        } catch {
            self.delegate?.didFailWithError(error: error)
        }
        return nil
    }
    
    
    
}
