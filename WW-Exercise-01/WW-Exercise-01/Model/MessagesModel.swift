//
//  MessagesModel.swift
//  WW-Exercise-01
//
//  Created by Ahmad Shahrouj on 8/28/18.
//  Copyright © 2018 Weight Watchers. All rights reserved.
//

import Foundation

struct MessagesModel: Decodable {
    var title: String
    var image: String
    var filter: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case image
        case filter
    }
    
    static func formattedData(data: Data) -> Any? {
        do {
            let contentModels = try JSONDecoder().decode([MessagesModel].self, from: data)
            return contentModels
        } catch {
            // An error has been occurred.
        }
        return nil
    }
}
