import Foundation
import UIKit


// -- Builder:

protocol WeatherListBuilder {
    
    func buildWeatherListModule() -> UIViewController?
}


// -- Router:

protocol WeatherListRouter {
    
    func navigateToWeatherDetail(city: String)
    func navigateToAddWeatherLocation()
}


// -- Interactor:

enum FetchWeatherResult {
    
    case Success(weather: [WeatherData])
    case Failure(reason: NSError)
}

protocol WeatherListInteractor: class {
    
    func fetchWeather(completion: (FetchWeatherResult) -> ())
}


// -- View Models:

struct WeatherItem {
    
    let cityName: String
    let temperature: String
}

struct WeatherListViewModel {
    let weatherItems : [WeatherItem]
}


// -- Presenter:

protocol WeatherListPresenter: class {
    
    var interactor  : WeatherListInteractor   {get}
    var router      : WeatherListRouter       {get}
    var view        : WeatherListView?        {get set}
    
    init(interactor: WeatherListInteractor, router: WeatherListRouter)
    
    func loadContent()
    func presentWeatherDetail(city: String)
    func presentAddWeatherLocation()
}


// -- View:

protocol WeatherListView: class {
    
    var viewModel: WeatherListViewModel? {get set}
    var presenter: WeatherListPresenter? {get set}
    
    func displayWeatherList(viewModel: WeatherListViewModel)
    func displayError(errorMessage: String)
}