//
//  CityListViewModelType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityListViewModelDelegate {
//    func cityListUpdated(cities: [WeatherCharacteristicsType])
}

protocol CityListViewModelType {
    var viewDelegate: CityListViewModelDelegate? { get set }
    var weatherItems: [WeatherCharacteristicsType] { get }
}
