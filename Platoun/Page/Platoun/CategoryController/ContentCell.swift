//
//  CategoryView.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {
    @IBOutlet weak var itemShop: ItemShop!
    
    var index: Int!
    var category: Category!
    
    func setup(index: Int, category: Category) {
        self.index = index
        self.category = category
        let product = data[category]![index]
        
        itemShop.title.text = product.title
        itemShop.subTitle.text = product.subTitle
        itemShop.image.image = UIImage(named: product.iconName)
        itemShop.rateView.rate = product.rate
        itemShop.rateView.rateNumber = product.nbRate
        itemShop.likeButton.isSelected = product.isLike
        itemShop.soloPrice.price = product.price
        itemShop.groupPrice.price = Int(Double(product.price) * Double(1-Double(product.prct) / 100))
        itemShop.pourcentView.prct = product.prct
        itemShop.delegate = self
    }
    
    
}
extension ContentCell: ItemShopDelegate {
    func onClick() {
        var p = data[category]![index]
        p.isLike = !p.isLike
        data[category]![index] = p
    }
}
