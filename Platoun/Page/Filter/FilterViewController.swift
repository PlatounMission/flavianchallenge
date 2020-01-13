//
//  FilterViewController.swift
//  Platoun
//
//  Created by Flavian Mary on 12/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

protocol FilterViewControllerDelegate {
    func update()
}

class FilterViewController: HavaViewController {
    var delegate: FilterViewControllerDelegate?
    
    @IBOutlet weak var food: UISwitch!
    @IBOutlet weak var toys: UISwitch!
    @IBOutlet weak var stroller: UISwitch!
    @IBOutlet weak var clothings: UISwitch!
    @IBOutlet weak var forMoms: UISwitch!
    @IBOutlet weak var furniture: UISwitch!
    @IBOutlet weak var hygiene: UISwitch!
    
    
    @IBAction func onBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func seeOffersPressed(_ sender: Any) {
        categoriesFiltred = filtredCategories
        self.delegate?.update()
        self.dismiss(animated: true, completion: nil)
    }
    
    var filtredCategories: [Category] = []
    
    func setupInitial() {
        self.food.isOn = true
        self.toys.isOn = true
        self.stroller.isOn = true
        self.clothings.isOn = true
        self.forMoms.isOn = true
        self.furniture.isOn = true
        self.hygiene.isOn = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filtredCategories = categoriesFiltred
        
        filtredCategories.forEach {
            switch $0 {
            case .stroller:
                self.stroller.isOn = false
            case .food:
                self.food.isOn = false
            case .toys:
                self.toys.isOn = false
            case .clothings:
                self.clothings.isOn = false
            case .forMoms:
                self.forMoms.isOn = false
            case .furniture:
                self.furniture.isOn = false
            case .hygiene:
                self.hygiene.isOn = false
            }
        }
        
    }
    
    @IBAction func toogleSwitch(_ sender: Any) {
        guard let switchObj = sender as? UISwitch else { return }
        
        if switchObj.isOn {
            removed(switchObj: switchObj)
        } else {
            append(switchObj: switchObj)
        }
    }
    
    func append(switchObj: UISwitch) {
        switch switchObj {
        case food:
            filtredCategories.append(.food)
        case toys:
            filtredCategories.append(.toys)
        case stroller:
            filtredCategories.append(.stroller)
        case clothings:
            filtredCategories.append(.clothings)
        case forMoms:
            filtredCategories.append(.forMoms)
        case furniture:
            filtredCategories.append(.furniture)
        case hygiene:
            filtredCategories.append(.hygiene)
        default:
            break
        }
    }
    
    func removed(switchObj: UISwitch) {
        switch switchObj {
        case food:
            filtredCategories.removeAll(where: { $0 == .food })
        case toys:
            filtredCategories.removeAll(where: { $0 == .toys })
        case stroller:
            filtredCategories.removeAll(where: { $0 == .stroller })
        case clothings:
            filtredCategories.removeAll(where: { $0 == .clothings })
        case forMoms:
            filtredCategories.removeAll(where: { $0 == .forMoms })
        case furniture:
            filtredCategories.removeAll(where: { $0 == .furniture })
        case hygiene:
            filtredCategories.removeAll(where: { $0 == .hygiene })
        default:
            break
        }
    }
    
    
}
