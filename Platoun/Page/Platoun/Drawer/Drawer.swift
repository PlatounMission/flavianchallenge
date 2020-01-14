//
//  Drawer.swift
//  Platoun
//
//  Created by Flavian Mary on 14/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol DrawwerDelegate {
    func back()
}

@IBDesignable
class Drawer: UIView {
    var view: UIView!
    
    var delegate: DrawwerDelegate?

    @IBOutlet weak var backButton: UILabel!
    
    convenience init() {
        self.init(frame: .zero)
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
        
        self.backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(back)))
    }

    @objc func back() {
        self.delegate?.back()
    }
}
