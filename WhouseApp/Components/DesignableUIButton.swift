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
    @IBInspectable var normalBorderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = normalBorderColor.cgColor
        }
    }
    
    @IBInspectable var normalBackgroundColor: UIColor = UIColor.white {
        didSet {
            backgroundColor = normalBackgroundColor
        }
    }
    
    @IBInspectable var highlightedBackgroundColor: UIColor = UIColor.white
    @IBInspectable var roundedButton: Bool = true
    @IBInspectable var cornerRadious: CGFloat = 0
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? highlightedBackgroundColor : normalBackgroundColor
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        if(roundedButton){
            layer.cornerRadius = layer.frame.height / 2
        }else{
            layer.cornerRadius = cornerRadious
        }
        layer.borderColor = normalBorderColor.cgColor
        backgroundColor = normalBackgroundColor
        
    }
    
}
