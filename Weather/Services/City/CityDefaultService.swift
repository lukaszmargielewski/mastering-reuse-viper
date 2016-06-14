//
//  CityDefaultService.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation

class CityDefaultService: CityService {
    
    func getCityList(completion: (CityServiceResult) -> ()) {
        completion(CityServiceResult.Success(citiesData: self.mockCitiesData()))
    }
    
    func saveCity(name: String, completion: (CityServiceSaveResult) -> ()) {
        completion(CityServiceSaveResult.Success(cityData: self.mockCityData(name)))
    }
    
    
    // -- MARK: Mocks:
    
    func mockCitiesData() -> [CityData] {
        return [
            CityData(name: "Copehagen"  , identifier: 1),
            CityData(name: "Warsaw"     , identifier: 2),
            CityData(name: "Fredericia" , identifier: 3),
            CityData(name: "Vejle"      , identifier: 4)
        ]
    }
    
    func mockCityData(name: String) -> CityData {
        return CityData(name: name, identifier: 5)
    }
}