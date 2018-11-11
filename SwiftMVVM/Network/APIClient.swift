//
//  APIClient.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import SwiftyJSON

class APIClient {
    
    public init() {}
    
    //Get Product List
    func getProductList(parameters: [String: AnyObject], callback: @escaping(ProductList?, String?) -> Void) {
        Alamofire.request(Router.productList(parameters: parameters)).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let productList = JSON(value)
                guard let parsedProductList = Mapper<ProductList>().map(JSON: productList.rawValue as! [String : Any]) else {
                    print("Mapping Error while parsing Product List")
                    return
                }
                callback(parsedProductList, nil)
            case .failure(_):
                callback(nil, "Some Error Occured")
            }
        }
    }
}
