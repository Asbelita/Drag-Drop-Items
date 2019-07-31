//
//  GradientView.swift
//  WhouseApp
//
//  Created by Manuel Bueno on 7/17/19.
//  Copyright © 2019 Nelumbo. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {

    @IBInspectable var topColor: UIColor = UIColor.white
    @IBInspectable var bottomColor: UIColor = UIColor.black
    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0, y: 0)
    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1, y: 1)
    @IBInspectable var hasGradient: Bool = true
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get{
            return self.layer.shadowOffset
        }
        set{
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set{
            self.layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat{
        get{
            return self.layer.shadowRadius
        }
        set{
            self.layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get{
            return self.layer.shadowOpacity
        }
        set{
            self.layer.shadowOpacity = newValue
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        if hasGradient {
            (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
            (layer as! CAGradientLayer).startPoint = startPoint
            (layer as! CAGradientLayer).endPoint = endPoint
        }
    }
        

}
