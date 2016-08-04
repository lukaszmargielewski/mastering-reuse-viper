//
//  CityNewPresenterType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityNewPresentingViewDelegate {
    func newCityCreated(city: City)
    func newCityCancelled()
}


protocol CityNewPresenterViewDelegate {
    func displayError(errorTitle: String, errorMessage: String)
}


protocol CityNewPresenterType {
    var viewDelegate: protocol<ViperViewDelegateType, CityNewPresenterViewDelegate>? { get set }

    init(interactor: CityNewInteractor, delegate: CityNewPresentingViewDelegate)
    func saveCity(name: String)
    func cancel()
}
