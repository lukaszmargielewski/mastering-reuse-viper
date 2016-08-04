//
//  CityListPresenter.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityListPresenterViewDelegate {
    func displayError(errorTitle: String, errorMessage: String)
}


protocol CityListPresenterType {

    var viewDelegate: protocol<ViperViewDelegateType, CityListPresenterViewDelegate>? { get set }

    init(interactor: CityListInteractorType, router: CityListRouterType)
    mutating func loadContent()
    func presentWeatherDetail(city: String)
    func presentAddWeatherLocation()

}
