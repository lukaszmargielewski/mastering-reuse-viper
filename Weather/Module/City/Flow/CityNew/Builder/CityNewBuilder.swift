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

    func buildNewCityModule(delegate: CityNewPresentingViewDelegate) -> UIViewController? {
        let interactor  = CityNewInteractor.init(cityService: CityDefaultService())
        let presenter   = CityNewPresenter.init(interactor: interactor, delegate: delegate)
        let view        = CityNewViewController(presenter: presenter)

        return view
    }

}
