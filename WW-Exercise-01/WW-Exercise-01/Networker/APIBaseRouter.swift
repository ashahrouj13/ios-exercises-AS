//
//  APIBaseRouter.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation
import Alamofire

protocol APIConfiguration {
    
    var method: Alamofire.HTTPMethod { get }
    var encoding: ParameterEncoding? { get }
    var path: String { get }
    var parameters: APIParams { get }
    var baseUrl: String { get }
}

protocol APIBaseRouter {
    
    var endpoint: APIEndpoint {get}
    init(endpoint: APIEndpoint)
}
