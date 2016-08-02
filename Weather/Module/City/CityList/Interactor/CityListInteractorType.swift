//
//  WeatherListInteractorType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


enum FetchWeatherResult {
    case Success(weather: [WeatherData])
    case Failure(reason: NSError)
}

protocol CityListInteractorType {
    var weatherService: WeatherService {get set}
    var cityService: CityService {get set}

    init(weatherService: WeatherService, cityService: CityService)
    func fetchWeather(completion: (FetchWeatherResult) -> ())
}
