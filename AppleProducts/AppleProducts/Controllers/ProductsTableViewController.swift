//
//  ProductsTableViewController.swift
//  AppleProducts
//
//  Created by Konstantinos Rizos on 28/01/2019.
//  Copyright © 2019 Konstantinos Rizos. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    // Data model
    
    var productLines: [ProductLine] = ProductLine.getProductLine()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Apple Store"
        
        navigationItem.rightBarButtonItem = editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return productLines[section].products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductTableViewCell
        
        let productLine = productLines[indexPath.section]
        let products = productLine.products
        let product = products[indexPath.row]
        
        cell.product = product
        
        return cell
    }
    
    // Multiple Sections
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let productLine = productLines[section]
        return productLine.name
    }
    
    // Delete Rows
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // delete the product from the productLine's products array
            let productLine = productLines[indexPath.section]
            productLine.products.remove(at: indexPath.row)
            
            // update the table view with new data
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // tableView.reloadData()  -- Bad way cause reload all the data
        }
    }
    
    // Moving Cells
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let productToMove = productLines[sourceIndexPath.section].products[sourceIndexPath.row]
        
        // Move productToMove to destination products
        productLines[destinationIndexPath.section].products.insert(productToMove, at: destinationIndexPath.row)
        
        // Delete the productToMove from the source products
        productLines[sourceIndexPath.section].products.remove(at: sourceIndexPath.row)
    }
    
    // UITableViewDelegate
    
    var selectedProduct: Product?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        selectedProduct = product
        
        performSegue(withIdentifier: "ShowProductDetail", sender: nil)
    }
    
    // Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowProductDetail" {
            let productDetailTVC = segue.destination as! ProductDetailTableViewController
            productDetailTVC.product = selectedProduct
        }
    }

}
