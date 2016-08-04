//
//  ViewDelegate.swift
//  Weather
//
//  Created by Steffen Damtoft Sommer on 02/08/16.
//  Copyright © 2016 MTT. All rights reserved.
//

import Foundation


protocol ViperViewDelegateType {
    func updateView(viewModel: ViperViewModelType)
}

extension ViperViewDelegateType {
    func updateView(viewModel: ViperViewModelType) {}
}
