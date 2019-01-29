//
//  ProductTableViewCell.swift
//  AppleProducts
//
//  Created by Konstantinos Rizos on 28/01/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    // Data Model
    
    var product: Product? {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI() {
        
        productImageView?.image = product?.image
        productTitleLabel?.text = product?.title
        productDescriptionLabel?.text = product?.description
    }
    
}
