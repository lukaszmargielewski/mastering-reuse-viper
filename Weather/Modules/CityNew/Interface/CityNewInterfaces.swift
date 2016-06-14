//
//  CityNewInterface.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


// ???: How to desing new city module so it works when dispalyed either by pushing or modal?

// ------------------------------- //
// -- Builder:
// ------------------------------- //

protocol CityNewDelegate : class {
    
    func newCityCreated(city: String)
    func newCityCancelled()
}

protocol CityNewBuilder {
    
    // ???: Should it return UIViewController or UINavigationController?
    func buildNewCityModule(delegate: CityNewDelegate) -> UIViewController?
}


// ------------------------------- //
// -- Presenter:
// ------------------------------- //

protocol CityNewPresenter {

    
    var         interactor  : WeatherListInteractor {get set}
    unowned var view        : WeatherListView       {get set}
    unowned var delegate    : CityNewDelegate       {get set}
    
    init(interactor: WeatherListInteractor, view: WeatherListView, delegate: CityNewDelegate)
    
    func cityNameUpdated(name : String)
    func doneTapped()
    func cancelTapped()
}



// ------------------------------- //
// -- Model:
// ------------------------------- //

struct City {
    
    let name        : String
    let identifier  : Int
}


// ------------------------------- //
// -- Interactor:
// ------------------------------- //

enum CitySaveResult {
    
    case Success(city: City)
    case Failure(reason: NSError)
}

protocol CityNewInteractor {
    
    var cityService : CityService {get set}
    init(cityService: CityService)
    
    func saveCity(name : String, completion: (CitySaveResult) -> ())
}


// ------------------------------- //
// -- View Model:
// ------------------------------- //

struct CityViewModel {
    
    var cityName            : String
    var saveButtonEnabled   : Bool
}

// ------------------------------- //
// -- View:
// ------------------------------- //

protocol CityNewView: class {

    var presenter: CityNewPresenter? {get set}
    
    func update(viewModel: CityViewModel)
    func displayError(errorMessage: String)
}