//
//  ViewController.swift
//  Tarea2
//
//  Created by:
//  - Garcia Camargo Jose Daniel
//  - Herrera Salvador Kenia
//  on 27/11/24.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productDetailImage: UIImageView!
    @IBOutlet weak var productDetailName: UILabel!
    
    
    var productsInfo:[Menu] = [
        Menu(imageName: "producto1", name: "Affogato"),
        Menu(imageName: "producto2", name: "Capuccino"),
        Menu(imageName: "producto3", name: "Cheesecake"),
        Menu(imageName: "producto4", name: "Galletas"),
        Menu(imageName: "producto5", name: "Latte"),
        Menu(imageName: "producto6", name: "Pancakes"),
        Menu(imageName: "producto7", name: "Carajillo"),
        Menu(imageName: "producto8", name: "Tosta"),
        Menu(imageName: "producto9", name: "Matcha"),]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func setProductDetailInfo(productImageName:String, productName:String) {
        productDetailImage.image = UIImage(named: productImageName)
        productDetailName.text = productName
    }
}


extension ViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let product = productsInfo[indexPath.row]
        
        cell.productImageCell.image = UIImage(named: product.productImageName)
        cell.productNameCell.text = product.productName
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsInfo[indexPath.row]
        self.setProductDetailInfo(productImageName: product.productImageName, productName: product.productName)

        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2,
                           animations: {
                               cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                           },
                           completion: { _ in
                               UIView.animate(withDuration: 0.2) {
                                   cell.transform = CGAffineTransform.identity
                               }
                           })
        }
    }
}
