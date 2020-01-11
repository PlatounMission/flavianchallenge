//
//  File.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import Foundation



var data:[Category: [Product]] = [
    .stroller:[
        Product(title: "Evening Dress", subTitle: "Dorothy Perkins", iconName: "Stroller 1", rate: 5, nbRate: 10, price: 315, prct: 8, isLike: false),
        Product(title: "Sport Dress", subTitle: "Sitlly", iconName: "Stroller 2", rate: 4, nbRate: 34, price: 310, prct: 8, isLike: true),
        Product(title: "Sport Dress", subTitle: "Dorothy Perkins", iconName: "Stroller 3", rate: 2, nbRate: 1, price: 315, prct: 8, isLike: false),
    ],
    .food:[
        Product(title: "Ratatouille légume", subTitle: "OVS", iconName: "Food 1", rate: 5, nbRate: 10, price: 15, prct: 20, isLike: false),
        Product(title: "Ratatouille purée", subTitle: "Mango Boy", iconName: "Food 2", rate: 4, nbRate: 34, price: 10, prct: 20, isLike: true),
        Product(title: "Petit pot carotte", subTitle: "Cool", iconName: "Food 3", rate: 2, nbRate: 1, price: 15, prct: 20, isLike: false),
    ],
    .toys:[
        Product(title: "Table baby", subTitle: "OVS", iconName: "Toy 1", rate: 0, nbRate: 0, price: 15, prct: 15, isLike: false),
        Product(title: "Baby Soother", subTitle: "Mango Boy", iconName: "Toy 2", rate: 0, nbRate: 0, price: 10, prct: 15, isLike: true),
        Product(title: "Hip fruits", subTitle: "Cool", iconName: "Toy 3", rate: 4, nbRate: 1, price: 15, prct: 15, isLike: false),
    ],
    .clothings:[
        Product(title: "Table baby", subTitle: "OVS", iconName: "Toy 1", rate: 0, nbRate: 0, price: 15, prct: 15, isLike: false),
        Product(title: "Baby Soother", subTitle: "Mango Boy", iconName: "Toy 2", rate: 0, nbRate: 0, price: 10, prct: 15, isLike: true),
        Product(title: "Hip fruits", subTitle: "Cool", iconName: "Toy 3", rate: 4, nbRate: 1, price: 15, prct: 15, isLike: false),
    ],
    .forMoms:[
        Product(title: "Table baby", subTitle: "OVS", iconName: "Toy 1", rate: 0, nbRate: 0, price: 15, prct: 15, isLike: false),
        Product(title: "Baby Soother", subTitle: "Mango Boy", iconName: "Toy 2", rate: 0, nbRate: 0, price: 10, prct: 15, isLike: true),
        Product(title: "Hip fruits", subTitle: "Cool", iconName: "Toy 3", rate: 4, nbRate: 1, price: 15, prct: 15, isLike: false),
    ],
    .furniture:[
        Product(title: "Table baby", subTitle: "OVS", iconName: "Toy 1", rate: 0, nbRate: 0, price: 15, prct: 15, isLike: false),
        Product(title: "Baby Soother", subTitle: "Mango Boy", iconName: "Toy 2", rate: 0, nbRate: 0, price: 10, prct: 15, isLike: true),
        Product(title: "Hip fruits", subTitle: "Cool", iconName: "Toy 3", rate: 4, nbRate: 1, price: 15, prct: 15, isLike: false),
    ],
    .hygiene:[
        Product(title: "Table baby", subTitle: "OVS", iconName: "Toy 1", rate: 0, nbRate: 0, price: 15, prct: 15, isLike: false),
        Product(title: "Baby Soother", subTitle: "Mango Boy", iconName: "Toy 2", rate: 0, nbRate: 0, price: 10, prct: 15, isLike: true),
        Product(title: "Hip fruits", subTitle: "Cool", iconName: "Toy 3", rate: 4, nbRate: 1, price: 15, prct: 15, isLike: false),
    ]
]

let categoriesFiltred: [Category] = []



enum Category: String {
    case food
    case toys
    case stroller
    case clothings
    case forMoms
    case furniture
    case hygiene
    
    var title: String {
        switch self {
        case .food:
            return "Food"
        case .toys:
            return "Toys"
        case .stroller:
            return "Stroller"
        case .clothings:
            return "Clothings"
        case .forMoms:
            return "For moms"
        case .furniture:
            return "Furniture"
        case .hygiene:
            return "Hygiene"
        }
    }
    
    var iconName: String {
        switch self {
        case .food:
            return "ic-header-2"
        case .toys:
            return "ic-header-3"
        case .stroller:
            return "ic-header-1"
        case .clothings:
            return "ic-header-4"
        case .forMoms:
            return "ic-header-7"
        case .furniture:
            return "ic-header-5"
        case .hygiene:
            return "ic-header-6"
        }
    }
}


struct Product {
    let title: String
    let subTitle: String
    let iconName: String
    let rate: Int
    let nbRate: Int
    let price: Int
    let prct: Int
    var isLike: Bool
}
