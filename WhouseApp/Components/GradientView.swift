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
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        (layer as! CAGradientLayer).startPoint = startPoint
        (layer as! CAGradientLayer).endPoint = endPoint
    }

}
