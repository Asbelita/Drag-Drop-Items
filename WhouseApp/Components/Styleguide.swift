//
//  Styleguide.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/7/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

enum Color {
    static let black = UIColor.black
    static let darkGray = UIColor.darkGray
    static let lightGray = UIColor.lightGray
    static let white = UIColor.white
    static let transparent = UIColor.clear
    static let primary = UIColor.appColor(.primaryColor)
    static let secundary = UIColor.appColor(.secundaryColor)
    static let tint = UIColor.appColor(.primaryColor)
}

extension TextStyle {
    
    static let body = TextStyle(
        font: UIFont.appFont(.roboto),
        color: Color.black
    )
    
    static let bodySmall = TextStyle(
        font: UIFont.appFont(.roboto).withSize(14.0),
        color: Color.black
    )
    
    static let sectionTitle = TextStyle(
        font: UIFont.appFont(.montserratBold),
        color: Color.primary
    )
    
    static let subtitle = TextStyle(
        font: UIFont.appFont(.montserrat),
        color: Color.black
    )
    
    static let subLabel = TextStyle(
        font: UIFont.appFont(.montserrat).withSize(12.0),
        color: Color.darkGray
    )
    
    static let subtitleBold = TextStyle(
        font: UIFont.appFont(.montserratBold),
        color: Color.black
    )
    
    static let screenTitle = TextStyle(
        font: UIFont.appFont(.montserratBold).withSize(18.0),
        color: Color.white)
    
    static let chatListTitle = TextStyle(
        font: UIFont.appFont(.robotoBold),
        color: Color.black
    )
    
    static let chatListBody = TextStyle(
        font: UIFont.appFont(.roboto).withSize(12.0),
        color: Color.lightGray
    )
    
    static let chatListBadge = TextStyle(
        font: UIFont.appFont(.roboto).withSize(12.0),
        color: Color.white
    )
}

extension TextStyle {

    enum Button {
        static let stickyCTA = TextStyle(
            font: UIFont.appFont(.montserratBold).withSize(20.0),
            color: Color.white
        )
    }
}

enum customFonts {
    case montserrat
    case montserratBold
    case roboto
    case robotoBold
}

extension UIFont {
    
    static func appFont(_ name: customFonts) -> UIFont {
        switch name {
        case .montserrat:
            return UIFont(name: "Montserrat", size: 16.0)!
        case .montserratBold:
            return UIFont(name: "Montserrat-Bold", size: 16.0)!
        case .roboto:
            return UIFont(name: "Roboto", size: 16.0)!
        case .robotoBold:
            return UIFont(name: "Roboto-Bold", size: 16.0)!
        }
    }
}

enum customColors {
    case primaryColor
    case secundaryColor
    case buttonPrimaryColor
    case buttonPrimaryColorHighlighted
    case successColor
    case errorColor
    case successColorHighlighted
    case errorColorHighlighted
}

extension UIColor {
    
    static func appColor(_ name: customColors) -> UIColor {
        switch name {
        case .primaryColor:
            return UIColor(named: "primaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .secundaryColor:
            return UIColor(named: "secundaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .buttonPrimaryColor:
            return UIColor(named: "buttonPrimaryColor", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .buttonPrimaryColorHighlighted:
            return UIColor(named: "buttonPrimaryHighlighted", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .successColor:
            return UIColor(named: "successGreen", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .errorColor:
            return UIColor(named: "errorRed", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .successColorHighlighted:
            return UIColor(named: "successGreenHighlighted", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        case .errorColorHighlighted:
            return UIColor(named: "errorRedHighlighted", in: Bundle(for: AppDelegate.self), compatibleWith: nil)!
        }
    }
}

enum appImages{
    case circleCheckedMd
    case circleUncheckedMd
    case circleChecked
    case circleUnchecked
    case whVerified
    case success
    case error
    case popularBadge
    case quickResponseBadge
    case mapMarker
}
extension UIImage {
    
    static func appImage(_ name: appImages) -> UIImage {
        switch name {
        case .circleUncheckedMd:
            return UIImage(named: "circleUnchecked_18")!
        case .circleCheckedMd:
            return UIImage(named: "circleChecked_18")!
        case .circleUnchecked:
            return UIImage(named: "circleUnchecked")!
        case .circleChecked:
            return UIImage(named: "circleChecked")!
        case .whVerified:
            return UIImage(named: "whVerified")!
        case .success:
            return UIImage(named: "success")!
        case .error:
            return UIImage(named: "error")!
        case .popularBadge:
            return UIImage(named: "badgeHeart")!
        case .quickResponseBadge:
            return UIImage(named: "badgeTime")!
        case .mapMarker:
            return UIImage(named: "mapMarker_18")!
        }
    }
}
