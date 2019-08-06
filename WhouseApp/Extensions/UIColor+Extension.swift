//
//  UIColor+Extension.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/5/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

enum AssetsColor {
    case primaryColor
    case secundaryColor
    case buttonPrimaryColor
    case buttonSecundaryColor
    case successColor
    case errorColor
}

extension UIColor {
    
    static func appColor(_ name: AssetsColor) -> UIColor {
        switch name {
        case .primaryColor:
            return UIColor(named: "primaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .secundaryColor:
            return UIColor(named: "secundaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .buttonPrimaryColor:
            return UIColor(named: "buttonPrimaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .buttonSecundaryColor:
            return UIColor(named: "buttonSecundaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .successColor:
            return UIColor(named: "successGreen", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .errorColor:
            return UIColor(named: "errorRed", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        }
    }
}
