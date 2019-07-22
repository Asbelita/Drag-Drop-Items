//
//  DesignableUIButton.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/18/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableUIButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    //Normal state bg and border
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            layer.borderColor = normalBorderColor?.cgColor
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor? {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        clipsToBounds = true
        
    }
    
}
