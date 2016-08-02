//
//  CityListViewModel.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityListViewModel: CityListViewModelType {
    var viewDelegate: CityListViewModelDelegate?
    var _weatherItems: [WeatherCharacteristicsType] = []
    var weatherItems: [WeatherCharacteristicsType] = []
}

extension CityListViewModel: CityListPresenterViewModelDelegate {
    mutating func citiesUpdated(cities: [WeatherCharacteristicsType]) {
        self._weatherItems = cities
        self.weatherItems = cities
//
//        let aa = [1,2,3]
//        aa.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
    }
}