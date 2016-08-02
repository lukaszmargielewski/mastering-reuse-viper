//
//  CityNewBuilderProtocol.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


protocol CityNewDelegate {
    func newCityCreated(city: City)
    func newCityCancelled()
}

protocol CityNewBuilderType {
    func buildNewCityModule(delegate: CityNewDelegate) -> UIViewController?
}
