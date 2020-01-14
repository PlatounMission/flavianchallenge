//
//  CategoryView.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol ContentCellDelegate {
    func onClicSoloPrice(category: Category, product: Product)
    func onClicGroupPrice(category: Category, product: Product)
}

class ContentCell: UICollectionViewCell {
    @IBOutlet weak var itemShop: ItemShop!
    
    var index: Int!
    var category: Category!
    var delegate: ContentCellDelegate?
    
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
        itemShop.groupPrice.price = product.groupPrice
        itemShop.pourcentView.prct = product.prct
        itemShop.delegate = self
    }
    
    
}
extension ContentCell: ItemShopDelegate {
    func clicGroupPrice() {
        self.delegate?.onClicGroupPrice(category: category, product: data[category]![index])
    }
    
    func clicSoloPrice() {
        self.delegate?.onClicSoloPrice(category: category, product: data[category]![index])
    }
    
    func onClic() {
        var p = data[category]![index]
        p.isLike = !p.isLike
        data[category]![index] = p
    }
}
