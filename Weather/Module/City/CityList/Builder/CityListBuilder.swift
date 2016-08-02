//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


struct CityListBuilder: CityListBuilderType {

    func buildCityListModule() -> UIViewController? {
        let router          = CityListRouter()
        let interactor      = CityListInteractor(weatherService: YahooWeatherService(), cityService: CityDefaultService())
        let presenter       = CityListPresenter(interactor: interactor, router: router)
        let viewModel       = CityListViewModel()
        let view            = CityListViewController(viewModel: viewModel, presenter: presenter)

        return view
    }

}
