//
//  CityNewDefaultPresenter.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation

class CityNewDefaultPresenter: CityNewPresenter {
    
    
    var         interactor  : CityNewInteractor
    unowned var view        : CityNewView
    unowned var delegate    : CityNewDelegate
    
    var cityName            : String?
    
    required init(interactor: CityNewInteractor, view: CityNewView, delegate: CityNewDelegate) {
    
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }
    
    func cityNameUpdated(name : String) {
    
        self.cityName = name
    }
    
    func doneTapped() {
    
        guard let cityName = self.cityName else {
        
            self.view.displayError("City name must not be empty")
            return
        }
        
        guard cityName.utf8.count >= 5 else {
            
            self.view.displayError("City name must be at least 5 characters long")
            return
        }
        
        self.interactor.saveCity(cityName) { (result : CitySaveResult) in
            print("Saving city: \(cityName) result: \(result)")
            switch result {
            case .Success(let city):
                self.delegate.newCityCreated(city)
                break
            case .Failure(let reason):
                self.view.displayError(reason.localizedDescription)
            }
        }
    }
    
    func cancelTapped() {
        self.delegate.newCityCancelled()
    }
}