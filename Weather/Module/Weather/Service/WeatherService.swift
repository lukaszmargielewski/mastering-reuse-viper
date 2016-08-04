//
//  WeatherService.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


enum WeatherServiceResult {
    case Success(weather: WeatherData)
    case Failure(reason: NSError)
}

struct WeatherData {
    let cityName: String
    let temperature: String
    let forecastInDays: [String]
    let temperatureUnit: String
}

protocol WeatherService {
    func weatherData(cityName: String) -> WeatherServiceResult
    func weatherData(cityName: String, completion: (WeatherServiceResult) -> ())
}
