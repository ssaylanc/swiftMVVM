//
//  ProductListTableViewController.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import UIKit

class ProductListTableViewController: UITableViewController {
    
    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProductList()
       
    }
    
    func getProductList() {
        //Show Loading
        showLoading(true)
        //Parameters example
        let parameters: [String: AnyObject] = ["size": 30 as AnyObject, "page": 1 as AnyObject, "sort": "small" as AnyObject, "query": "shoes" as AnyObject, "category_id": 12 as AnyObject, "brand": "nike" as AnyObject]
        viewModel.getProductList(parameters: parameters, success: {
            self.tableView.reloadData()
            //Hide Loading
            self.showLoading(false)
        }) { (error) in
            //Hide Loading
            self.showLoading(false)
            //Display an alert with error
            self.displayAlert(error)
            print(error)
        }
    }

    func showLoading(_ loading: Bool) {
        //Show / Hide Loading View
    }

    func displayAlert(_ alertInfo: String) {
        //Display alert
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.viewModel.numberOfItemsInSection(section: section) else {return 0}
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductListTableViewCell

        if let vm = self.viewModel.viewModelForProductListItem(at: indexPath.row) {
            cell.setupCell(withViewModel: vm)
        }
        
        return cell
    }
}
