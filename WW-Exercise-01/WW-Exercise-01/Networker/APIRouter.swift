//
//  APIRouter.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation
import Alamofire


public typealias JSONDictionary = [String: AnyObject]
typealias APIParams = [String : AnyObject]

struct APIRouter: URLRequestConvertible {
    
    var endpoint: APIEndpoint
    
    init(endpoint: APIEndpoint) {
        
        self.endpoint = endpoint
    }
    
    //prod
    var baseUrl: String {
        let baseUrl = "https://www.weightwatchers.com/assets/cmx/us/"
        return baseUrl
    }
    
    var method: Alamofire.HTTPMethod {
        
        return APIMethod.init(endpoint: endpoint).method
    }
    
    var path: String {
        
        return APIPath.init(endpoint: endpoint).path
    }
    
    var parameters: APIParams {
        
        return APIParameters.init(endpoint: endpoint).parameters
    }
    
    var encoding: ParameterEncoding? {
        
        return APIEncoding.init(endpoint: endpoint).encoding
    }
    
    var response: APIResponse {
        
        return APIResponse.init(endpoint: endpoint)
    }
    
    /// Returns a URL request or throws if an `Error` was encountered.
    /// - throws: An `Error` if the underlying `URLRequest` is `nil`.
    /// - returns: A URL request.
    
    func asURLRequest() throws -> URLRequest {
        
        let urlString = baseUrl + path
        guard let url = URL(string: urlString) else {
            return URLRequest(url: URL(fileURLWithPath: ""))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        guard let encoding = try encoding?.encode(urlRequest, with: self.parameters) else { return urlRequest }
        return encoding
    }

}
