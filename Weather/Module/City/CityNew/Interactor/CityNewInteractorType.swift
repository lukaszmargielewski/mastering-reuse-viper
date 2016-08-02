//
//  CityNewInteractorType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


enum CitySaveResult {
    case Success(city: City)
    case Failure(reason: NSError)
}

protocol CityNewInteractorType {
    var cityService: CityService { get set }
    init(cityService: CityService)

    func saveCity(name: String, completion: (CitySaveResult) -> ())
}
