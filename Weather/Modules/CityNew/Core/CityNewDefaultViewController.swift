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
    
    override func viewDidLoad() {
        
        
        guard let _ = self.navigationController else {
        
            print("This implementation supports modal presnetation only and therefor requies to be presented withen UINavigationController.")
            return
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Save, target: self, action: #selector(save))
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem.init(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
    }
    
    func save(sender: UIBarButtonItem) {
        self.presenter?.doneTapped()
    }
    
    func cancel(sender: UIBarButtonItem) {
        self.presenter?.cancelTapped()
    }
    // -- MARK: CityNewView
    
    func update(viewModel: CityViewModel) {
    
    }
    
    func displayError(errorMessage: String) {
    
        let alert = UIAlertController(title: "Oops!", message:errorMessage, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            // Put here any code that you would like to execute when
            // the user taps that OK button (may be empty in your case if that's just
            // an informative alert)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
    }
}
