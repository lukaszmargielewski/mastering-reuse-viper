//
//  CityNewPresenterType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityNewPresenterType {

    var interactor: CityNewInteractor { get set }
    var view: CityNewViewType { get set }
    var delegate: CityNewDelegate { get set }

    init(interactor: CityNewInteractor, view: CityNewViewType, delegate: CityNewDelegate)
    mutating func cityNameUpdated(name: String)
    func doneTapped()
    func cancelTapped()

}
