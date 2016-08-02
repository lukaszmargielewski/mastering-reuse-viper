//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityListInteractor: CityListInteractorType {

    var weatherService: WeatherService
    var cityService: CityService

    init(weatherService: WeatherService, cityService: CityService) {
        self.weatherService = weatherService
        self.cityService = cityService
    }

    func fetchWeather(completion: (FetchWeatherResult) -> ()) {
        self.cityService.getCityList { (citiesResult) in
            switch citiesResult {
            case .Success(let citiesData):
                if let data = citiesData {
                    completion(.Success(weather: self.cityWeatherFromCityData(data)))
                    return
                }
                completion(.Success(weather: [self.emptyWeatherData("no cities found")]))
                return
            case .Failure(_):
                completion(.Success(weather: [self.emptyWeatherData("Failure getting  cities")]))
                return
            }
        }
    }

    func cityWeatherFromCityData(citiesData: [CityData]) -> [WeatherData] {
        let citiesWeather = citiesData.map { (city) -> WeatherData in
            switch self.weatherService.weatherData(city.name) {
            case .Success(let weather):
                return weather
            case .Failure(_):
                return emptyWeatherData(city.name)
            }
        }
        return citiesWeather
    }

    func emptyWeatherData(cityName: String) -> WeatherData {
        return WeatherData(cityName: cityName, temperature: "n/a", forecastInDays: [], temperatureUnit: "n/a")
    }

}
