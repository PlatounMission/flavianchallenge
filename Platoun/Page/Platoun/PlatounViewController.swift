//
//  PlatounViewController.swift
//  Platoun
//
//  Created by Flavian Mary on 11/01/2020.
//  Copyright © 2020 Flavian Mary. All rights reserved.
//

import UIKit

class PlatounViewController: HavaViewController {
    let containerTableId = "containerTableId"
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterByView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.tintColor = UIColor.rgb(red: 117, green: 117, blue: 177)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "ic-burger"),
            landscapeImagePhone: nil,
            style: .plain,
            target: self,
            action: #selector(clicBurger))
        
        self.filterByView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clicFilteBy)))
        
        setupTableView()
    }
    
    @objc func clicBurger() {
        
    }
    
    @objc func clicFilteBy() {
        self.performSegue(withIdentifier: "showFilterBy", sender: nil)
    }

    fileprivate func setupTableView() {
        tableView.register(ContainerCategoryCell.self, forCellReuseIdentifier: containerTableId)
        tableView.separatorStyle = .none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showFilterBy":
            guard let vc = segue.destination as? FilterViewController else { return }
            vc.delegate = self
        default:
            break
        }
    }
}

extension PlatounViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let categories = Array(data.keys).filter { !categoriesFiltred.contains($0) }
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: containerTableId, for: indexPath) as? ContainerCategoryCell else { return UITableViewCell() }
        let categories = Array(data.keys)
            .filter { !categoriesFiltred.contains($0) }
            .sorted(by: { $0.rawValue < $1.rawValue })
        cell.category = categories[indexPath.row]
        cell.containerController = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 425
    }
}

extension PlatounViewController: FilterViewControllerDelegate {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
