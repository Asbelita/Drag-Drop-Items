//
//  StyleguideHelpers.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 8/7/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

// MARK: Structs
struct TextStyle {
    let font: UIFont
    let color: UIColor
}

struct ViewStyle {
    
    struct LayerStyle {
        
        struct BorderStyle {
            let color: UIColor
            let width: CGFloat
        }
        
        struct ShadowStyle {
            let color: UIColor
            let radius: CGFloat
            let offset: CGSize
            let opacity: Float
        }
        
        let masksToBounds: Bool?
        let cornerRadius: CGFloat?
        let borderStyle: BorderStyle?
        let shadowStyle: ShadowStyle?
    }
    
    let backgroundColor: UIColor?
    let tintColor: UIColor?
    let layerStyle: LayerStyle?
}

// MARK: Helper protocols
protocol TextStyling {
    func style(style: TextStyle)
}

protocol ViewStyling {
    func style(style: ViewStyle)
}

// MARK: Helper extensions
extension UIView: ViewStyling {
    
    func style(style: ViewStyle) {
        if let backgroundColor = style.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let tintColor = style.tintColor {
            self.tintColor = tintColor
        }
        if let layerStyle = style.layerStyle {
            if let cornerRadius = layerStyle.cornerRadius {
                self.layer.cornerRadius = cornerRadius
            }
            if let masksToBounds = layerStyle.masksToBounds {
                self.layer.masksToBounds = masksToBounds
            }
            if let borderStyle = layerStyle.borderStyle {
                self.layer.borderColor = borderStyle.color.cgColor
                self.layer.borderWidth = borderStyle.width
            }
            if let shadowStyle = layerStyle.shadowStyle {
                self.layer.shadowColor = shadowStyle.color.cgColor
                self.layer.shadowOffset = shadowStyle.offset
                self.layer.shadowRadius = shadowStyle.radius
                self.layer.shadowOpacity = shadowStyle.opacity
            }
        }
    }
}

extension UILabel: TextStyling {
    
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
    }
}

extension UIButton: TextStyling {
    
    func style(style: TextStyle) {
        titleLabel?.font = style.font
        setTitleColor(style.color, for: .normal)
    }
}

extension UITextField: TextStyling {
    
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
    }
}

extension UITextView: TextStyling {
    
    func style(style: TextStyle) {
        font = style.font
        textColor = style.color
    }
}
