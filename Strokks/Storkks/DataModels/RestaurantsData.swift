//
//  RestaurantsData.swift
//  Storkks
//
//  Created by gaian  on 8/13/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit
import Foundation

class RestaurantsData: NSObject {

    struct Shops: Decodable {
        let count: Int
         let status: Bool
        let path: String
        let list: [shop]
        
        enum CodingKeys : String, CodingKey {
            case count = "totalshops"
            case status
            case path = "imagepath"
            case list = "shops"
        }
    }
    
    struct shop: Decodable {
        let id: String
        let name: String
        let Cuisine: String
        let phone: String
        let contact_name: String
        let email: String
        let m_resturant_opens: String
        let m_resturant_close: String
        let shop_logo: String
        let estimated_delivery_time: String
        let description: String
        let address: String
        
        
    }

}
