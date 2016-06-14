//
//  CityNewDefaultBuilder.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit

class CityNewDefaultBuilder : CityNewBuilder {
    
    func buildNewCityModule(delegate: CityNewDelegate) -> UIViewController? {
        
        let interactor = CityNewDefaultInteractor.init(cityService: CityDefaultService())
        let view = CityNewDefaultViewController()
        let presenter = CityNewDefaultPresenter.init(interactor: interactor, view: view, delegate: delegate)
        
        view.presenter = presenter
        
        return view
    }
}