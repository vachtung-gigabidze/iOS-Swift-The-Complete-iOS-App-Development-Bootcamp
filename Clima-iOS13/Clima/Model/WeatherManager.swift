//
//  WeatherManager.swift
//  Clima
//
//  Created by Дмирий Зядик on 07.10.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWaether(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=799e6e18f1d66ec6caa395c43ef209d3&units=metric"
    var delegate: WeatherManagerDelegate?
    func fetchWeather(cityName: String){
        let urlString = "\(weatherURL)&=\(cityName)"
        performRequest(wuth: urlString)
    }
    
    func performRequest(wuth urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate.?.didFailWithError(error: error)
                    return
                }
                if let safeData = data {
                    if let weather = parseJSON(safeData) {
                        
                        delegate?.didUpdateWaether(self ,weather: weather)
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
            self.delegate.?.didFailWithError(error: error)
        }
        return nil
    }
    
    
    
}
