//
//  LocationsAssembly.swift
//  testRickAndMorty
//
//  Created by anduser on 31.05.2022.
//

import Foundation
import UIKit
import SwiftUI

struct LocationsAssembly {
    
    static func createModule() {
        let viewController = LocationsViewContrioller()
        viewController.presenter = LocationsPresenter(view: viewController,
                                                      networkService: LocationNetworkService())
        
        
    }
}
