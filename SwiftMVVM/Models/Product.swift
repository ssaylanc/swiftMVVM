//
//  Product.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductList : NSObject, NSCoding, Mappable{
    public var products : [Product]?
    public var result : Bool?
    public var size : Int?
    
    class func newInstance(map: Map) -> Mappable?{
        return ProductList()
    }
    required public init?(map: Map){}
    private override init(){}
    
    public func mapping(map: Map)
    {
        products <- map["products"]
        result <- map["result"]
        size <- map["size"]
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required public init(coder aDecoder: NSCoder)
    {
        products = aDecoder.decodeObject(forKey: "products") as? [Product]
        result = aDecoder.decodeObject(forKey: "result") as? Bool
        size = aDecoder.decodeObject(forKey: "size") as? Int
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc public func encode(with aCoder: NSCoder)
    {
        if products != nil{
            aCoder.encode(products, forKey: "products")
        }
        if result != nil{
            aCoder.encode(result, forKey: "result")
        }
        if size != nil{
            aCoder.encode(size, forKey: "size")
        }
    }
}

class Product : NSObject, NSCoding, Mappable{
    public var name : String?
    public var color : String?
    public var sellingPrice : String?

    public class func newInstance(map: Map) -> Mappable?{
        return Product()
    }
    required public init?(map: Map){}
    private override init(){}
    
    public func mapping(map: Map)
    {
        name <- map["name"]
        color <- map["color"]
        sellingPrice <- map["selling_price"]
    }
    
    @objc required public init(coder aDecoder: NSCoder)
    {
        name = aDecoder.decodeObject(forKey: "name") as? String
        color = aDecoder.decodeObject(forKey: "color") as? String
        sellingPrice = aDecoder.decodeObject(forKey: "selling_price") as? String
    }
    
    @objc public func encode(with aCoder: NSCoder)
    {
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if color != nil{
            aCoder.encode(color, forKey: "color")
        }
        if sellingPrice != nil{
            aCoder.encode(sellingPrice, forKey: "selling_price")
        }
    }
}
