//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityListPresenter: CityListPresenterType, CityNewDelegate {

    var interactor: CityListInteractorType
    var router: CityListRouterType
    var viewDelegate: CityListPresenterViewDelegate?
    var viewModelDelegate: CityListPresenterViewModelDelegate?

    init(interactor: CityListInteractorType, router: CityListRouterType) {
        self.interactor = interactor
        self.router     = router
    }

    mutating func loadContent() {
        self.interactor.fetchWeather { (result) in
            switch result {
            case .Success(let fetchedWeather):
                self.viewModelDelegate?.citiesUpdated(self.buildViewModelForWeatherData(fetchedWeather))
                break
            case .Failure:
                break
//                self.viewDelegate?.displayError("Error!", errorMessage: reason.localizedDescription)
            }
        }
    }

    func presentWeatherDetail(city: String) {
        self.router.navigateToCityDetail(self.viewDelegate, city: city)
    }

    func presentAddWeatherLocation() {
        self.router.navigateToAddCityLocation(self.viewDelegate, delegate: self)
    }

    func newCityCreated(city: City) {
        self.router.closeAddCityLocation(self.viewDelegate)
//        self.viewDelegate?.displayError("SUCCESS!", errorMessage: "City created: \(city.name)")
    }

    func newCityCancelled() {
        self.router.closeAddCityLocation(self.viewDelegate)
    }

    private func buildViewModelForWeatherData(weatherData: [WeatherData]) -> [WeatherCharacteristicsType] {
        let weatherItems = weatherData.map { (item) -> WeatherCharacteristicsType in
            return WeatherCharacteristics(cityName: item.cityName, temperature: item.temperature)
        }

//        return CityListViewModel(weatherItems: weatherItems)
        return weatherItems
    }

}
