//
//  UIView+Identifier.swift
//  testRickAndMorty
//
//  Created by anduser on 05.07.2022.
//

import UIKit

extension UIView {
    static func getIdentifier() -> String {
        return String(describing: Self.self)
    }
}
