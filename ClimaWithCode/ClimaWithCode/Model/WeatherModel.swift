//
//  WeatherModel.swift
//  Clima
//
//  Created by Дмирий Зядик on 10.10.2024.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double   
    
    var conditionName: String {
        return getConditionName(weatherId: conditionId)
    }
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    func getConditionName(weatherId: Int) -> String {
        return switch weatherId {
                case 200...232:
                     "cloud.bolt"
                case 300...321:
                     "cloud.drizzle"
                case 500...531:
                     "cloud.rain"
                case 600...622:
                     "cloud.snow"
                case 701...781:
                     "cloud.fog"
                case 800:
                     "sun.max"
                case 801...804:
                     "cloud.bolt"
                default:
                     "cloud"
                }

    }
}
