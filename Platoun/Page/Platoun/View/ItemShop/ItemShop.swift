//
//  ItemShop.swift
//  Platoun
//
//  Created by Flavian Mary on 10/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol ItemShopDelegate {
    func onClic()
    func clicSoloPrice()
    func clicGroupPrice()
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
        
        self.containerLikeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClic)))
        
        
        self.soloPrice.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClicSoloPrice)))
        self.groupPrice.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onClicGroupPrice)))
    }
    
    @objc func onClicSoloPrice() {
        self.delegate?.clicSoloPrice()
    }
    
    @objc func onClicGroupPrice() {
        self.delegate?.clicGroupPrice()
    }
    
    @objc func onClic() {
        self.likeButton.toggle()
        self.delegate?.onClic()
    }
}
