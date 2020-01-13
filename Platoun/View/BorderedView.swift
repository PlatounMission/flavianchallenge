//
//  BorderedView.swift
//  Platoun
//
//  Created by Flavian Mary on 12/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedView: UIView {    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBInspectable
    var isShadowed: Bool = false
    
    @IBInspectable
       var borderWidth: CGFloat = 1
    
    @IBInspectable
       var cornerRadius: CGFloat = 3
    
    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.layer.borderColor = UIColor.rgb(red: 224, green: 224, blue: 224).cgColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = self.borderWidth
        
        if !isShadowed { return }
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 1

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
