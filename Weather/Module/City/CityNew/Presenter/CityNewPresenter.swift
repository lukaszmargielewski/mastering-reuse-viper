//
//  CityNewDefaultPresenter.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityNewPresenter: CityNewPresenterType {

    var interactor: CityNewInteractor
    var view: CityNewViewType
    var delegate: CityNewDelegate

    var cityName: String?

    init(interactor: CityNewInteractor, view: CityNewViewType, delegate: CityNewDelegate) {
        self.interactor = interactor
        self.view = view
        self.delegate = delegate
    }

    mutating func cityNameUpdated(name: String) {
        self.cityName = name
    }

    func doneTapped() {
        guard let cityName = self.cityName else {
            self.view.displayError("City name", errorMessage: "must not be empty")
            return
        }

        guard cityName.utf8.count >= 5 else {
            self.view.displayError("City name", errorMessage: "must be at least 5 characters long")
            return
        }

        self.interactor.saveCity(cityName) { (result: CitySaveResult) in
            switch result {
            case .Success(let city):
                print("Saved successfully city: \(cityName) result: \(result)")
                self.delegate.newCityCreated(city)
                break
            case .Failure(let reason):
                print("Failure creating city: \(cityName) result: \(result)")
                self.view.displayError("Error", errorMessage: reason.localizedDescription)
            }
        }
    }

    func cancelTapped() {
        self.delegate.newCityCancelled()
    }

}
