//
//  CityListViewModelType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityListViewModelType: ViperViewModelType {
    var weatherItems: [WeatherCharacteristicsType] { get }
}
