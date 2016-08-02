//
//  CityNewDefaultBuilder.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


struct CityNewBuilder: CityNewBuilderType {

    func buildNewCityModule(delegate: CityNewDelegate) -> UIViewController? {
        let interactor  = CityNewInteractor.init(cityService: CityDefaultService())
        let view        = CityNewDefaultViewController()
        let presenter   = CityNewPresenter.init(interactor: interactor, view: view, delegate: delegate)

        view.presenter  = presenter

        return view
    }

}
