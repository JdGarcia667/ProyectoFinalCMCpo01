//
//  Productos.swift
//  Proyecto Final
//
//  Created by:
//  - Garcia Camargo Jose Daniel
//  - Herrera Salvador Kenia
//  on 27/11/24.
//

import Foundation
import UIKit


class Menu {
    var productImage:UIImage
    var productName:String
    
    init(imageName:String, name:String) {
        self.productImage = UIImage(named: imageName)!
        self.productName = name
    }
    
    init(image:UIImage, name:String) {
        self.productImage = image
        self.productName = name
    }
}
