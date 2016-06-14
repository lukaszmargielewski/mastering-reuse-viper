//
//  CityNewDefaultViewController.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import UIKit
import SnapKit

class CityNewDefaultViewController: UIViewController, CityNewView, UITextFieldDelegate {
    
    var presenter: CityNewPresenter?
    var textField : UITextField?
    
    // -- Mark UIViewController:
    
    override func loadView() {
        
        let textField = UITextField()
        let view = UIView()
        view.backgroundColor  = UIColor.whiteColor()
        view.addSubview(textField)
        
        textField.layer.borderWidth = 1
        textField.delegate = self
        textField.becomeFirstResponder()
        
        self.view       = view
        self.textField  = textField
       
        textField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(30)
            make.right.equalTo(-30)
            make.top.equalTo(self.snp_topLayoutGuideBottom).offset(30)
            make.height.equalTo(40)
        }
        
    }
    
    override func viewDidLoad() {
        
        guard let _ = self.navigationController else {
        
            print("This implementation supports modal presnetation only and therefor requies to be presented withen UINavigationController.")
            return
        }
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Save, target: self, action: #selector(save))
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem.init(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
    }
    
    
    // -- MARK: UITextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let userEnteredString = textField.text
        let newString = (userEnteredString! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        self.presenter?.cityNameUpdated(newString)
        return true
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
    
    func displayError(errorTitle: String, errorMessage: String) {
    
        let alert = UIAlertController(title: errorTitle, message:errorMessage, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
            // Put here any code that you would like to execute when
            // the user taps that OK button (may be empty in your case if that's just
            // an informative alert)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true){}
    }
}
