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
        let id : String
        let name : String
        let Cuisine : String
        let phone : String
        let contact_name : String
        let email : String
        let order_position : String
        let password : String
        let status : String
        let m_resturant_opens : String
        let m_resturant_close : String
        let e_resturant_opens : String
        let e_resturant_close : String
        let shop_logo : String
        let pure_veg : String
        let min_amount : String
        let min_amount_offer : String
        let discount : String
        let offer_percentage : String
        let offertitle : String
        let estimated_delivery_time : String
        let description : String
        let location : String
        let address : String
        let paymentmode : String
        let latitude : String
        let longitude : String
        let everyday : String
        let create_date : String
        let modified_date : String        
    }
}
