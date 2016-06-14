//
//  CityNewDefaultInteractor.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation

class CityNewDefaultInteractor: CityNewInteractor {
    
    var cityService : CityService
    
    required init(cityService: CityService) {
        self.cityService = cityService
    }
    
    func saveCity(name: String, completion: (CitySaveResult) -> ()) {
        
        self.cityService.saveCity(name) { (result : CityServiceSaveResult) in
        
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