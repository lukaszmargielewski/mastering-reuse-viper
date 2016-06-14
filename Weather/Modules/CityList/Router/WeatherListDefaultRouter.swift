import Foundation
import UIKit

class WeatherListDefaultRouter: WeatherListRouter {

    unowned var viewController: UIViewController
    
    required init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToWeatherDetail(city: String) {
        if let weatherDetailVC = self.weatherDetailBuilder()?.buildWeatherDetailModule(city){
            self.viewController.navigationController?.pushViewController(weatherDetailVC, animated: true)
        }
    }
    
    func navigateToAddWeatherLocation(delegate: CityNewDelegate) {
        // TODO
        if let cityAddVC = self.cityNewBuilder()?.buildNewCityModule(delegate) {
            let navigationController = UINavigationController.init(rootViewController: cityAddVC)
            self.viewController.navigationController?.presentViewController(navigationController, animated: true, completion: nil)
        }
    }
    
    func closeAddWeatherLocation() {
        // TODO
        self.viewController.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func weatherDetailBuilder() -> WeatherDetailBuilder? {
        return WeatherDetailDefaultBuilder()
    }
    
    private func cityNewBuilder() -> CityNewBuilder? {
        return CityNewDefaultBuilder()
    }
}
