//
//  APIManager.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation
import Alamofire

protocol APIManagerModeling {
    
    func request(apiRouter:APIRouter, showAlert: Bool, completionHandler: @escaping (_ responseData: Any, _ success: Bool) -> Void)
}

class APIManager: Alamofire.SessionManager, APIManagerModeling {
    
    func request(apiRouter:APIRouter, showAlert: Bool, completionHandler: @escaping (_ responseData: Any, _ success: Bool) -> Void) {
        
        self.request(apiRouter).responseData { responseData in
            
            if responseData.response == nil {
                completionHandler([String:AnyObject](), false)
                return
            }
            
            let statusCode = responseData.response?.statusCode ?? 0
           
            switch statusCode {
                
            case 200...204: // Success
                
                if let data = responseData.data, let model = apiRouter.response.model(data) {
                    completionHandler(model, true)
                }else {
                    completionHandler(responseData, true)
                }
                
            default:
                if statusCode != NSURLErrorCancelled {
                    self.onErrorCanceled(showAlert: showAlert, responseData: responseData, completionHandler: completionHandler)
                }
            }
        }
    }
    
    func onErrorCanceled(showAlert: Bool, responseData: DataResponse<Data>, completionHandler: @escaping ([String: AnyObject], Bool) -> Void) {
        
        // An error has been occurred.
        
        let dataObject = [String:AnyObject]()
        completionHandler(dataObject, false)
    }
    
}
