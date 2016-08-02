//
//  CityListViewControllerType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol CityListViewType: class {
    var viewModel: CityListViewModelType! { get set }
    var presenter: CityListPresenterType! { get set }
}
