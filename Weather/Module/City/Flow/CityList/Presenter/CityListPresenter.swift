//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityListPresenter: ViperPresenterType, CityListPresenterType, CityNewPresentingViewDelegate {

    private var interactor: CityListInteractorType
    private var router: CityListRouterType

    var viewDelegate: protocol<ViperViewDelegateType, CityListPresenterViewDelegate>?


    // MARK: - Object life cycle -

    init(interactor: CityListInteractorType, router: CityListRouterType) {
        self.interactor = interactor
        self.router     = router
    }


    // MARK: - View actions -

    mutating func loadContent() {
        self.interactor.fetchWeather { (result) in
            switch result {
            case .Success(let fetchedWeather):
                self.viewDelegate?.updateView(self.buildViewModelForWeatherData(fetchedWeather))
                break
            case .Failure(let reason):
                break
                self.viewDelegate?.displayError("Error!", errorMessage: reason.localizedDescription)
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
        self.viewDelegate?.displayError("Success", errorMessage: "City created: \(city.name)")
    }

    func newCityCancelled() {
        self.router.closeAddCityLocation(self.viewDelegate)
    }


    // MARK: - Helpers -

    private func buildViewModelForWeatherData(weatherData: [WeatherData]) -> CityListViewModelType {
        let weatherItems = weatherData.map { (item) -> WeatherCharacteristicsType in
            return WeatherCharacteristics(cityName: item.cityName, temperature: item.temperature)
        }

        return CityListViewModel(weatherItems: weatherItems)
    }

}
