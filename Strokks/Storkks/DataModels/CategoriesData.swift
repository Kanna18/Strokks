//
//  CategoriesData.swift
//  Storkks
//
//  Created by gaian  on 8/14/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class CategoriesData: NSObject {
    
    struct Categories: Decodable {
        let count: Int
        let status: Bool
        let categories: [Category]
        
        enum CodingKeys : String, CodingKey {
            case count = "totalshops"
            case status
            case categories
        }
    }
    
    struct Category: Decodable {
        let id: String
        let restaurant_id: String
        let restaurant_name: String
        let cat_name: String
        let cat_description: String
        let cat_opens: String
        let cat_close: String
        let cat_order: String
        let status: String
                
    }
    
}
