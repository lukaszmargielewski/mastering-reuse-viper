//
//  CityListRouterType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


protocol CityListRouterType {
//    unowned var viewController: UIViewController {get set}

//    init(viewController: UIViewController)
    func navigateToCityDetail(from: CityListPresenterViewDelegate?, city: String)
    func navigateToAddCityLocation(from: CityListPresenterViewDelegate?, delegate: CityNewDelegate)
    func closeAddCityLocation(from: CityListPresenterViewDelegate?)
}
