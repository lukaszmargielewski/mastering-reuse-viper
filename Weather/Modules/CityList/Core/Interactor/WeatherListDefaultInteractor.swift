import Foundation


class WeatherListDefaultInteractor: WeatherListInteractor {
    
    var weatherService: WeatherService
    var cityService: CityService
    
    required init(weatherService: WeatherService, cityService: CityService) {
        self.weatherService = weatherService
        self.cityService = cityService
    }
    
    func fetchWeather(completion: (FetchWeatherResult) -> ()){
        
        let cities = self.allCities()
        
        let citiesWeather = cities.map { (cityName) -> WeatherData in
            switch self.weatherService.weatherData(cityName) {
            case .Success(let weather):
                return weather
            case .Failure(_):
                return emptyWeatherData(cityName)
            }
        }
        
        completion(FetchWeatherResult.Success(weather: citiesWeather))
    }
    
    func allCities() -> [String] {
        // Access actual storage
        let cityNames = self.cityService.cityList().map { (city) -> String in
            return city.name
        }
        
        return cityNames
    }
    
    func emptyWeatherData(cityName: String) -> WeatherData {
        return WeatherData(cityName: cityName, temperature: "n/a", forecastInDays: [], temperatureUnit: "n/a")
    }
}
