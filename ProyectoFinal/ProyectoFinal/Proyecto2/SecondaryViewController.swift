//
//  SecondaryViewController.swift
//  Proyecto Final
//
//  Created by:
//  - Garcia Camargo Jose Daniel
//  - Herrera Salvador Kenia
//  on 27/11/24.
//

import UIKit

class SecondaryViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var productsInCart:[Menu] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension SecondaryViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        let product = productsInCart[indexPath.row]
        
        cell.imageView?.image = product.productImage
        cell.textLabel?.text = product.productName
        
        return cell
    }
    
    
}

