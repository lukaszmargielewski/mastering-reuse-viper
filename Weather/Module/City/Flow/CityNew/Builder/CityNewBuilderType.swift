//
//  CityNewBuilderProtocol.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


protocol CityNewBuilderType {
    func buildNewCityModule(delegate: CityNewPresentingViewDelegate) -> UIViewController?
}
