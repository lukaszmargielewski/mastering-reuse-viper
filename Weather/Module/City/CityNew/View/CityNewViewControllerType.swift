//
//  CityNewViewControllerType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityNewViewType: class {
    var presenter: CityNewPresenter? { get set }

    func update(viewModel: CityViewModel)
    func displayError(errorTitle: String, errorMessage: String)
}
