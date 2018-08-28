//
//  APIResponse.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation

struct APIResponse: APIBaseRouter {
    
    var endpoint: APIEndpoint
    init(endpoint: APIEndpoint) {
        self.endpoint = endpoint
    }
    
    func model(_ response: Data) -> Any? {
        
        switch endpoint {
        case .getMessages:
            return MessagesModel.formattedData(data:response)
        }
    }
}
