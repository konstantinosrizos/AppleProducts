//
//  ProductDetailTableViewController.swift
//  AppleProducts
//
//  Created by Konstantinos Rizos on 28/01/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Product"
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
        productDescriptionTextView.text = product?.description
    }
    
    // UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            return indexPath
        } else {
            return nil
        }
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        productDescriptionTextView.resignFirstResponder()
        productTitleTextField.resignFirstResponder()
    }
    
}

//extension ProductDetailTableViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//
//        textField.resignFirstResponder()
//        return true
//    }
//}
