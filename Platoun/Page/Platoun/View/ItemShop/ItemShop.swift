//
//  ItemShop.swift
//  Platoun
//
//  Created by Flavian Mary on 10/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol ItemShopDelegate {
    func onClick()
}

@IBDesignable
class ItemShop: UIView {
    var view: UIView!
    var delegate: ItemShopDelegate?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likeButton: LikeButton!
    @IBOutlet weak var containerLikeButton: UIView!
    @IBOutlet weak var rateView: RateView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var soloPrice: PriceButton!
    @IBOutlet weak var groupPrice: PriceButton!
    @IBOutlet weak var pourcentView: PourcentView!
    
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
        
        self.containerLikeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClick)))
    }
    
    @objc func onClick() {
        self.likeButton.toggle()
        self.delegate?.onClick()
    }
}
