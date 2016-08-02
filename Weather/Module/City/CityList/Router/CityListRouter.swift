//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//


import Foundation
import UIKit


struct CityListRouter: CityListRouterType {

    func navigateToCityDetail(from: CityListPresenterViewDelegate?, city: String) {
        if let viewController = from as? UIViewController, let weatherDetailVC = self.weatherDetailBuilder()?.buildWeatherDetailModule(city) {
            viewController.navigationController?.pushViewController(weatherDetailVC, animated: true)
        }
    }

    func navigateToAddCityLocation(from: CityListPresenterViewDelegate?, delegate: CityNewDelegate) {
        if let viewController = from as? UIViewController, let cityAddVC = self.cityNewBuilder()?.buildNewCityModule(delegate) {
            let navigationController = UINavigationController.init(rootViewController: cityAddVC)
            viewController.navigationController?.presentViewController(navigationController, animated: true, completion: nil)
        }
    }

    func closeAddCityLocation(from: CityListPresenterViewDelegate?) {
        if let viewController = from as? UIViewController {
            viewController.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    private func weatherDetailBuilder() -> WeatherDetailBuilder? {
        return WeatherDetailDefaultBuilder()
    }

    private func cityNewBuilder() -> CityNewBuilder? {
        return CityNewBuilder()
    }

}
