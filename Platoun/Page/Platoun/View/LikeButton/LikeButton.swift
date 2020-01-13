//
//  LikeButton.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

@IBDesignable
class LikeButton: UIView {
    var view: UIView!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var heartIcon: UIImageView!
    
    @IBInspectable
    var isSelected: Bool = false {
        didSet {
            heartIcon.image = self.isSelected ? UIImage(named: "ic-heart-on") : UIImage(named: "ic-heart-off")
        }
    }
    
    @objc func toggle() {
        self.isSelected = !self.isSelected
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadViewFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadViewFromNib()
    }
    
    func loadViewFromNib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        view.autoresizingMask = [
            UIView.AutoresizingMask.flexibleWidth,
            UIView.AutoresizingMask.flexibleHeight
        ]
        addSubview(view)
        self.view = view
    }
    
    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        self.layer.cornerRadius = bounds.height / 2
        self.content.layer.cornerRadius = bounds.height / 2
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: self.layer.cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor

            shadowLayer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            shadowLayer.shadowOpacity = 1
            shadowLayer.shadowRadius = 1

            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
