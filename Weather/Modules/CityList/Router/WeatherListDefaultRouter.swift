import Foundation
import Swinject

class WeatherListDefaultRouter: WeatherListRouter {
    
    // ???: Why do we need this weak variable here?
    weak var viewController: UIViewController?
    
    func navigateToWeatherDetail(city: String) {
        if let weatherDetailVC = self.weatherDetailBuilder()?.buildWeatherDetailModule(city) {
            self.viewController?.navigationController?.pushViewController(weatherDetailVC, animated: true)
        }
    }
    
    func navigateToAddWeatherLocation() {
        // TODO
    }
    
    private func weatherDetailBuilder() -> WeatherDetailBuilder? {
        return Container.sharedContainer.resolve(WeatherDetailBuilder.self)
    }
    
}