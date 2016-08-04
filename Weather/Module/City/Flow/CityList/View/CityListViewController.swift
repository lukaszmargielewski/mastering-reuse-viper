//
//  CityListBuilderType.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 15/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


class CityListViewController: UITableViewController, ViperViewType, CityListViewType {

    private var viewModel: CityListViewModelType?
    private var presenter: CityListPresenterType! {
        willSet {
            if presenter != nil {
                presenter.viewDelegate = nil
            }
        }

        didSet {
            presenter.viewDelegate = self
        }

    }


    // MARK: - Object life cycle -

    required init(presenter: ViperPresenterType) {
        super.init(style: UITableViewStyle.Plain)

        defer {
            if let presenter = presenter as? CityListPresenterType {
                self.presenter = presenter
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.addButtonItem()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.presenter.loadContent()

    }


    // MARK: - Table view data source -

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.weatherItems.count ?? 0
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.viewModel?.weatherItems[indexPath.row].cityName
        cell.detailTextLabel?.text = self.viewModel?.weatherItems[indexPath.row].temperature

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let city = self.viewModel?.weatherItems[indexPath.row].cityName {
            self.presenter.presentWeatherDetail(city)
        }
    }


    // MARK: - Helpers -

    private func addButtonItem() -> UIBarButtonItem {
        return UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(self.addWeatherLocation))
    }

    @objc private func addWeatherLocation() {
        self.presenter.presentAddWeatherLocation()
    }

}


// MARK: - Extensions -

// MARK: View delegate

extension CityListViewController: ViperViewDelegateType {
    func updateView(viewModel: ViperViewModelType) {
        if let viewModel = viewModel as? CityListViewModelType {
            self.viewModel = viewModel
            self.tableView.reloadData()
        }
    }
}


// MARK: City list presenter view delegate

extension CityListViewController: CityListPresenterViewDelegate {
    func displayError(errorTitle: String, errorMessage: String) {
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(cancelAction)

        self.presentViewController(alert, animated: true, completion: nil)
    }
}
