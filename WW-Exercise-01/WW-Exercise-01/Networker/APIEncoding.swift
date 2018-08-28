//
//  APIEncoding.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation
import Alamofire

struct APIEncoding: APIBaseRouter {
    
    var endpoint: APIEndpoint
    init(endpoint: APIEndpoint) {
        self.endpoint = endpoint
    }
    
    var encoding: ParameterEncoding {
        
        switch endpoint {
        case .getMessages:
            return URLEncoding.default
        }
    }
}
