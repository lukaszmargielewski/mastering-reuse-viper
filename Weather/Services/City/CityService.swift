//
//  CityService.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityData {
    
    let name        : String
    let identifier  : Int
}

enum CityServiceResult {
    
    case Success(citiesData: [CityData]?)
    case Failure(reason: NSError)
}

enum CityServiceSaveResult {
    
    case Success(cityData: CityData)
    case Failure(reason: NSError)
}

protocol CityService {
    
    func cityList() -> [CityData]
    func getCityList(completion:(CityServiceResult) -> ())
    func saveCity(name: String, completion:(CityServiceSaveResult) -> ())
}