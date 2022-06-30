//
//  UpToDatable.swift
//  testRickAndMorty
//
//  Created by anduser on 07.06.2022.
//

import Foundation
import UIKit

protocol UpToDatable where Self: UIView {
    func updateInterface(_ model: Any)
}
