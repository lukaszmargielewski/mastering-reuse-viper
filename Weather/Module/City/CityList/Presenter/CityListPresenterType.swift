//
//  CityListPresenter.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityListPresenterViewDelegate {

}

protocol CityListPresenterViewModelDelegate {
    mutating func citiesUpdated(cities: [WeatherCharacteristicsType])
}


protocol CityListPresenterType {
    var interactor: CityListInteractorType { get set }
    var router: CityListRouterType { get set }
    var viewDelegate: CityListPresenterViewDelegate? { get set }
    var viewModelDelegate: CityListPresenterViewModelDelegate? { get set }

    init(interactor: CityListInteractorType, router: CityListRouterType)
    mutating func loadContent()
    func presentWeatherDetail(city: String)
    func presentAddWeatherLocation()
}
