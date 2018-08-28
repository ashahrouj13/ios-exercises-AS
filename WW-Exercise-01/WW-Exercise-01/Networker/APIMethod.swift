//
//  APIMethod.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation
import Alamofire

struct APIMethod: APIBaseRouter {
    
    var endpoint: APIEndpoint
    init(endpoint: APIEndpoint) {
        self.endpoint = endpoint
    }
    
    var method: Alamofire.HTTPMethod {
        
        switch endpoint {
            
        case .getMessages:
            return .get
        }
    }
}
