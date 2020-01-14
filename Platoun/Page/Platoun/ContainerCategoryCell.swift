//
//  ContainerCategoryCell.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol ContainerCategoryCellDelegate {
    func seeAllClick(category: Category)
    func onClicSoloPrice(category: Category, product: Product)
    func onClicGroupPrice(category: Category, product: Product)
}

class ContainerCategoryCell: UITableViewCell {
    var delegate: ContainerCategoryCellDelegate?
    lazy var header: HeaderCategoryView = {
        let header = HeaderCategoryView()
        header.delegate = self
        header.title = "Stroller"
        return header
    }()
    
    let footer: UIView = {
            let footer = UIView()
            footer.backgroundColor = UIColor.rgb(red: 249, green: 249, blue: 249)
            return footer
        }()
    
    weak var containerController: PlatounViewController? {
        didSet {
            setupChildViews()
        }
    }
    
    var category: Category! {
        didSet {
            header.title = self.category.title
            header.icon.image = UIImage(named: self.category.iconName)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(header)
        header.anchor(top: topAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 90)
        
        addSubview(footer)
        footer.anchor(top: nil, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 35)
    }
    
    fileprivate func setupChildViews() {
        guard let containerController = containerController else { return }
        let flowlayout = UICollectionViewFlowLayout()
        let contentCollection = CategoryController(collectionViewLayout: flowlayout, type: self.category)
        contentCollection.delegate = self
        flowlayout.scrollDirection = .horizontal
        
        containerController.addChild(contentCollection)
        addSubview(contentCollection.view)
        contentCollection.didMove(toParent: containerController)
        
        contentCollection.view.anchor(top: header.bottomAnchor, paddingTop: 0, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 300)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContainerCategoryCell: HeaderCategoryViewDelegate {
    func seeAllClick() {
        self.delegate?.seeAllClick(category: self.category)
    }
}

extension ContainerCategoryCell: CategoryControllerDelegate {
    func onClicSoloPrice(category: Category, product: Product) {
        self.delegate?.onClicSoloPrice(category: category, product: product)
    }
    
    func onClicGroupPrice(category: Category, product: Product) {
        self.delegate?.onClicGroupPrice(category: category, product: product)
    }
}
