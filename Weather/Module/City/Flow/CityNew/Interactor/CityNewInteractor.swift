//
//  CityNewDefaultInteractor.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityNewInteractor: CityNewInteractorType {

    private var cityService: CityService


    // MARK: - Object life cycle -

    init(cityService: CityService) {
        self.cityService = cityService
    }


    // MARK: - CityNewInteractorType -

    func saveCity(name: String, completion: (CitySaveResult) -> ()) {
        self.cityService.saveCity(name) { (result: CityServiceSaveResult) in
            switch result {
                case .Success(let cityData):
                    let city = City(name: cityData.name, identifier: cityData.identifier)
                    completion(CitySaveResult.Success(city: city))
                break

                case .Failure(let reason):
                    completion(CitySaveResult.Failure(reason: reason))
                break
            }
        }
    }

}
