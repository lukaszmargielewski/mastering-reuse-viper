//
//  CityNewDefaultViewController.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import UIKit

class CityNewDefaultViewController: UIViewController, CityNewView {
    
    var presenter: CityNewPresenter?
    
    
    // -- Mark UIViewController:
    
    // -- MARK: CityNewView
    
    func update(viewModel: CityViewModel) {
    
    }
    
    func displayError(errorMessage: String) {
    
    }
}
