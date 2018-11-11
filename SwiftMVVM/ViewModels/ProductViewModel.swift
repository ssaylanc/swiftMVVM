//
//  ProductViewModel.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    public init() {}
    public var productList: ProductList?
    
    public var api = APIClient()
    
    func getProductList(parameters: [String: AnyObject], success: @escaping() -> Void,
                        failure: @escaping (String) -> Void) {
        api.getProductList(parameters: parameters) { (data, error) in
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
            }
            
            if let data = data {
                self.productList = data
                DispatchQueue.main.async {
                    success()
                }
            }
        }
    }
    
    public func numberOfItemsInSection(section: Int) -> Int? {
        return productList?.products?.count ?? 0
    }
    
    public func viewModelForProductListItem(at index: Int) -> ProductListItemViewModel? {
        let product = productList?.products?[index]
        return ProductListItemViewModel(product: product!)
    }
}

struct ProductListItemViewModel {
    public var product: Product
    
    public var name: String? {
        guard let name = product.name else {return "Name is Empty!"}
        return name
    }
    
    public var color: String? {
        guard let color = product.color else {return "Color is Empty!"}
        return color
    }
    
    public var price: String? {
        guard let price = product.name else {return "Price is Empty!"}
        return price
    }
    
}
