//
//  CityViewModelType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityViewModelType {
    var cityName: String { get }
    var saveButtonEnabled: Bool { get }
}
