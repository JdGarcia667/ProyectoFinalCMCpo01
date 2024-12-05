//
//  MainViewController.swift
//  Proyecto Final
//
//  Created by:
//  - Garcia Camargo Jose Daniel
//  - Herrera Salvador Kenia
//  on 27/11/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func addToCartAction(_ sender: Any) {
        if productDetailName.text != "Nombre del producto" {
            addProductToCart(product: Menu(image: productDetailImage.image!, name: productDetailName.text!))
            
            let tabBar = self.tabBarController!.tabBar
            let downloadItem = tabBar.items![1]
            downloadItem.badgeColor = UIColor.red
            downloadItem.badgeValue = "\(productsInCart.count)"
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "secondaryViewController") as! SecondaryViewController
            vc.productsInCart = productsInCart
            present(vc, animated: false)
        }
    }
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
    
    var productsInCart:[Menu] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func setProductDetailInfo(productImage:UIImage, productName:String) {
        
        productDetailImage.image = productImage
        productDetailName.text = productName
    }
    func addProductToCart(product:Menu) {
        productsInCart.append(product)
    }
}

extension MainViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        let product = productsInfo[indexPath.row]
        
        cell.productImageCell.image = product.productImage
        cell.productNameCell.text = product.productName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsInfo[indexPath.row]
        self.setProductDetailInfo(productImage: product.productImage, productName: product.productName)
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
