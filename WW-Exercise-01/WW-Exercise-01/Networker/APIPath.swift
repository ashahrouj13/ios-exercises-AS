//
//  APIPath.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation

struct APIPath: APIBaseRouter {
    
    var endpoint: APIEndpoint
    init(endpoint: APIEndpoint) {
        self.endpoint = endpoint
    }
    
    var path: String {
        
        switch endpoint {
        case .getMessages:
            return "messages/collections.json"
        }
    }
}
