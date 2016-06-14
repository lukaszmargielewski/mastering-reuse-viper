import Foundation
import UIKit


/// The idea behind keeping all protocol declarations for all VIPER module building blocks
/// (Router, Builder, Presenter, Interactor, ViewModel and View) in one file
/// is to make it more explicit that they work together to construct a VIPER module.

// -- Questions (Debate):

// 1. Is that good approach?
// 2. Should we strive to have naming convention for it to emphasizes that we use VIPER architectural pattern, f.ex:
//      CityListViperModule.swift, CityListModule.swift, CityListVIPER.swift, etc...)
// 3. How should we define protocols? As loose as possible or as explicit as possible? (more details in comments below).

// ------------------------------- //
// -- Builder:
// ------------------------------- //

protocol WeatherListBuilder {
    
    // ???: Should we be explicit if / when this is UINavigationController?
    
    func buildWeatherListModule() -> UIViewController?
}


// ------------------------------- //
// -- Router:
// ------------------------------- //

protocol WeatherListRouter {
    
    /// Just so router can do its navigation job
    /// with UIKit navigation stack.
    
    // ???: 1. Is that a good idea to declare such dependencies in a protocol?
    //          Those protocols define interfaces to speficic module, so being specific could be probably desired.
    //          .... or not?
    //      2. Should we be explicit if / when this is UINavigationController?
    
    unowned var viewController: UIViewController {get set}
    
    /// An initializer instantiating router with required viewController.
    /// The idea is to make it explicit what init should be used
    /// to initialize router with controller needed for it to work properly.
    
    // ???: Is that a good idea to declare such initializer in protocol,
    //      Or should they be a part of contrete implementation instead?
    
    init(viewController: UIViewController)
    
    func navigateToWeatherDetail(city: String)
    
    // ???: Is that a good place to for dismiss delegate?
    // ???: Should it be optional?
    func navigateToAddWeatherLocation(delegate: CityNewDelegate)
    func closeAddWeatherLocation()
}


// ------------------------------- //
// -- Interactor:
// ------------------------------- //

enum FetchWeatherResult {
    
    case Success(weather: [WeatherData])
    case Failure(reason: NSError)
}

protocol WeatherListInteractor: class {
    
    // ???: Is that a good idea to declare this dependency in a protocol?
    //      (see more in WeatherListPresenter debate questions)
    
    var weatherService: WeatherService {get set}
    
    /// An initializer instantiating interactor with required (?) dependency.
    /// The idea is to make it explicit what init should be used
    /// to initialize required & non-optional weather service property.
    // ???: 1. Is that a good idea to declare such initializer in protocol
    //      (see more in WeatherListPresenter debate questions)
    
    init(weatherService: WeatherService)
    
    func fetchWeather(completion: (FetchWeatherResult) -> ())
}


// ------------------------------- //
// -- Presenter:
// ------------------------------- //

protocol WeatherListPresenter: class {
    
    /// Required dependencies for that presenter in VIPER architecture.
    /// The idea is to make it explicit in protocol what other components
    /// are needed for this module presenter to function.
    
    // ???: Is that a good idea to declare those dependencies in protocol?
    
    var         interactor  : WeatherListInteractor {get set}
    
    // ???: Should we strive to have non-optional properties as much as possible?
    //
    //      It let's you (benefits):
    //
    //      1. declare required dependencies in more explicit way (clear that something is really required).
    //      2. keep the syntaxt cleaner (less ? madness)
    //
    //      But introduces following (donw-sides):
    //
    //      1. Need for have values for those properties inilized, which
    //         practically requires to have specific initializer.
    //      2. Needs decision in specific initializer should be part of protocol as well.
    
    var         router      : WeatherListRouter     {get set}
    
    // ???: onowned vs weak debate (Swift related)
    //
    // Benefits:
    //      1. onowned allows to declare required, but non-retained property as non-optional
    //
    // Donw-sides:
    //      1. not clear what happends when object is released (either property owner the one pointed by it)
    //          (Swift noobness).
    
    unowned var view        : WeatherListView       {get set}
    
    /// An initializer instantiating presenter with required dependencies.
    /// The idea is to make it explicit what init should be used
    /// to initialize all required & non-optional properties.
    // ???: 1. Is that a good idea to declare such initializer in protocol,
    //      Or should they be a part of contrete implementation instead?
    //      2. Should we declare it as required? (required init ...)?
    //
    // Benefits:
    //
    //  1. States that strategic required dependenceis should be known up front.
    //  2. Helps convey the fact that those dependencies must be initialized properly when this object is initialized/
    //  3. Helps to clarify order in which module components should be constructed ( see WeatherListDefaultBuilder.swift).
    //
    // Downsides:
    //  1. Adds some restictions
    //  2. Could make it harder to test (mock all dependencies).
    
    init(interactor: WeatherListInteractor, router: WeatherListRouter, view: WeatherListView)
    
    //Interface:
    
    func loadContent()
    func presentWeatherDetail(city: String)
    func presentAddWeatherLocation()
}


// ------------------------------- //
// -- View Models:
// ------------------------------- //

struct WeatherItem {
    
    let cityName    : String
    let temperature : String
}

struct WeatherListViewModel {
    let weatherItems : [WeatherItem]
}


// ------------------------------- //
// -- View:
// ------------------------------- //

protocol WeatherListView: class {
    
    /// Optional presenter dependency for that view in VIPER architecture.
    // ???: Is that a good idea to declare such dependency in protocol,
    // ???: or should it be a part of contrete implementation instead?
    
    var presenter: WeatherListPresenter? {get set}
    
    //Interface:
    
    func displayWeatherList(viewModel: WeatherListViewModel)
    func displayError(errorTitle: String, errorMessage: String)
}
