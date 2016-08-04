//
//  CityNewDefaultPresenter.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


struct CityNewPresenter: ViperPresenterType, CityNewPresenterType {

    private var interactor: CityNewInteractor
    private var delegate: CityNewPresentingViewDelegate

    var viewDelegate: protocol<ViperViewDelegateType, CityNewPresenterViewDelegate>?


    // MARK: - Object life cycle -

    init(interactor: CityNewInteractor, delegate: CityNewPresentingViewDelegate) {
        self.interactor = interactor
        self.delegate = delegate
    }


    // MARK: - CityNewPresenterType -

    func saveCity(name: String) {
        guard name.characters.count >= 5 else {
            self.viewDelegate?.displayError("City name", errorMessage: "must be at least 5 characters long")
            return
        }

        self.interactor.saveCity(name) { (result: CitySaveResult) in
            switch result {
            case .Success(let city):
                print("Saved successfully city: \(name) result: \(result)")
                self.delegate.newCityCreated(city)
                break
            case .Failure(let reason):
                print("Failure creating city: \(name) result: \(result)")
                self.viewDelegate?.displayError("Error", errorMessage: reason.localizedDescription)
            }
        }
    }

    func cancel() {
        self.delegate.newCityCancelled()
    }

}
