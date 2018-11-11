//
//  Router.swift
//  SwiftMVVM
//
//  Created by ssaylanc on 11.11.2018.
//  Copyright © 2018 ssaylanc. All rights reserved.
//

import Foundation
import Alamofire

public enum Router: URLRequestConvertible {
    
    case productList(parameters: Parameters)
    
    static let baseURLString = "Your API URL Here"
    static let AuthorizationHeaderKey = "Authorization"
    
    public var path: String {
        switch self {
        case .productList:
            return "/Your product list url"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .productList:
            return .post //.get or .post which one is required is based on backend.
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try Router.baseURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        let newURLRequest = urlRequest.description.removingPercentEncoding
        let convertedURL = URL(string: newURLRequest!)
        urlRequest = URLRequest(url: convertedURL!)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .productList(let parameters):
           urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
