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
    func navigateToCityDetail(from: CityListPresenterViewDelegate?, city: String)
    func navigateToAddCityLocation(from: CityListPresenterViewDelegate?, delegate: CityNewPresentingViewDelegate)
    func closeAddCityLocation(from: CityListPresenterViewDelegate?)
}
