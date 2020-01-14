//
//  CustomTabBar.swift
//  Platoun
//
//  Created by Flavian Mary on 14/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

class CustomTabBar: UITabBarController {

    var leftConstraint: NSLayoutConstraint?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawer = Drawer()
        drawer.delegate = self
        self.view.addSubview(drawer)
        
        drawer.translatesAutoresizingMaskIntoConstraints = false
        
        leftConstraint = drawer.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: -300)
        
        
        NSLayoutConstraint.activate([
            leftConstraint!,
            drawer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            drawer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            drawer.widthAnchor.constraint(equalToConstant: 300)
        ])

        // Do any additional setup after loading the view.
    }
    
    func openDrawer() {
        leftConstraint?.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func closeDrawer() {
        leftConstraint?.constant = -300
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

extension CustomTabBar: DrawwerDelegate {
    func back() {
        self.closeDrawer()
    }
}
