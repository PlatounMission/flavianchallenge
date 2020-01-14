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
    
    var customTabBar: CustomTabBar?
    
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
        
        self.filterByView
            .addGestureRecognizer(
                UITapGestureRecognizer(
                    target: self, action: #selector(clicFilteBy)))
        customTabBar = self.tabBarController as? CustomTabBar
        setupTableView()
    }
        
    @objc func clicBurger() {
        customTabBar?.openDrawer()
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
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 425
    }
}

extension PlatounViewController: ContainerCategoryCellDelegate {
    func seeAllClick(category: Category) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let label = UILabel()
        label.text = "Product list for \(category.title)"
        vc.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        self.present(vc, animated: true)
    }
    
    func onClicSoloPrice(category: Category, product: Product) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let label = UILabel()
        label.text = "\(product.title) - solo price => \(product.price)$"
        vc.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        self.present(vc, animated: true)
    }
    
    func onClicGroupPrice(category: Category, product: Product) {
        let vc = UIViewController()
        vc.view.backgroundColor = .white
        let label = UILabel()
        label.text = "\(product.title) - group price => \(product.groupPrice)$"
        vc.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor)
        ])
        self.present(vc, animated: true)
    }
}

extension PlatounViewController: FilterViewControllerDelegate {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension UIViewController {

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
