//
//  Router.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 16/06/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation
import UIKit


protocol Router {
    func navigate(from: UIViewController, to: UIViewController)
}