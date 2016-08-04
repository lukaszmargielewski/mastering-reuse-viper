//
//  CityNewDefaultViewController.swift
//  Weather
//
//  Created by Lukasz Marcin Margielewski on 14/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import UIKit
import SnapKit


class CityNewViewController: UIViewController, ViperViewType, CityNewViewType, ViperViewDelegateType, CityNewPresenterViewDelegate {

    private var presenter: CityNewPresenterType? {
        willSet {
            if presenter != nil {
                presenter?.viewDelegate = nil
            }
        }

        didSet {
            presenter?.viewDelegate = self
        }

    }
    private var textField: UITextField?


    // MARK: - Object life cycle -

    required init(presenter: ViperPresenterType) {
        super.init(nibName: nil, bundle: nil)

        defer {
            if let presenter = presenter as? CityNewPresenterType {
                self.presenter = presenter
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
            print("This implementation supports modal presentation only and therefore requies to be presented withen UINavigationController.")
            // TODO: Implement an option when this is shown without navigation controller (f.ex.: not modal)
            return
        }

        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Save, target: self, action: #selector(save))
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem.init(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
    }


    // MARK: - CityNewViewType -

    func displayError(errorTitle: String, errorMessage: String) {
        let alert = UIAlertController(title: errorTitle, message:errorMessage, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default) { _ in
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true) {}
    }


    // MARK: - Helpers -

    @objc private func save(sender: UIBarButtonItem) {
        self.presenter?.saveCity(self.textField?.text ?? "")
    }

    @objc private func cancel(sender: UIBarButtonItem) {
        self.presenter?.cancel()
    }

}


// MARK: - Extensions -

// MARK: UITextFieldDelegate

extension CityNewViewController: UITextFieldDelegate {
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
