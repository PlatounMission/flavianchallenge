//
//  CategoryController.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol CategoryControllerDelegate {
    func onClicSoloPrice(category: Category, product: Product)
    func onClicGroupPrice(category: Category, product: Product)
}

class CategoryController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let contentCellId = "contentCellId"
    let category: Category
    var delegate: CategoryControllerDelegate? = nil
    
    init(collectionViewLayout layout: UICollectionViewLayout, type: Category) {
        self.category = type
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = UIColor.rgb(red: 249, green: 249, blue: 249)
        let nib = UINib(nibName: "ContentCell", bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: contentCellId)
        collectionView?.register(ContentCell.self, forCellWithReuseIdentifier: "cellId")
    }
}

extension CategoryController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data[category]?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: contentCellId, for: indexPath) as! ContentCell
        cell.setup(index: indexPath.row, category: category)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
}

extension CategoryController: ContentCellDelegate {
    func onClicSoloPrice(category: Category, product: Product) {
        self.delegate?.onClicSoloPrice(category: category, product: product)
    }
    
    func onClicGroupPrice(category: Category, product: Product) {
        self.delegate?.onClicGroupPrice(category: category, product: product)
    }
}
