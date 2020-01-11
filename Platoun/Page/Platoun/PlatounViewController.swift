//
//  PlatounViewController.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

class PlatounViewController: UITableViewController {
    let containerTableId = "containerTableId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    fileprivate func setupTableView() {
        tableView.register(ContainerCategoryCell.self, forCellReuseIdentifier: containerTableId)
        tableView.separatorStyle = .none
    }
}

extension PlatounViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categories = Array(data.keys).filter { !categoriesFiltred.contains($0) }
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: containerTableId, for: indexPath) as? ContainerCategoryCell else { return UITableViewCell() }
        let categories = Array(data.keys).filter { !categoriesFiltred.contains($0) }
        cell.category = categories [indexPath.row]
        cell.containerController = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 390
    }
}
