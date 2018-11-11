//
//  ProductListTableViewCell.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productColorLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func setupCell(withViewModel viewModel: ProductListItemViewModel) {
        productNameLabel.text = viewModel.name
        productColorLabel.text = viewModel.color
        productPriceLabel.text = viewModel.price
    }
    
}
