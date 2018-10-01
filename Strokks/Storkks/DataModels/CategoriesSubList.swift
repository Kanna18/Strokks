//
//  CategoriesSubList.swift
//  Storkks
//
//  Created by Gaian on 19/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class CategoriesSubList: NSObject {
    
    struct SubList : Decodable{
        let totalproducts: Int?
        let status: Bool?
        let products: [Product]?
        
        enum CodingKeys : String,CodingKey  {
            
            case totalproducts
            case status
            case products
        }
    }
  
    struct Product : Decodable,Equatable {
        let id : String
        let restaurant_id : String
        let restaurant_name : String
        let product_name : String
        let description : String
        let category : String
        let product_Order : String
        let product_image : String
        let is_featured : String
        let featured_position : String
        let featured_image : String
        let price : String
        let m_product_opens : String
        let m_product_close : String
        let e_product_opens : String
        let e_product_close : String
        let pure_veg : String
        let discount : String
        let discount_type : String
        let addons : String
        let addons_cat : String
        let addons_price : String
        let status : String
        let create_date : String
        let modefied_date : String
    
        
        static func == (lhs: Product, rhs: Product) -> Bool {
            return lhs.id == rhs.id &&
            lhs.restaurant_id == rhs.restaurant_id &&
            lhs.product_name == rhs.product_name &&
            lhs.description == rhs.description &&
            lhs.category == rhs.category &&
            lhs.product_Order == rhs.product_Order &&
            lhs.product_image == rhs.product_image &&
            lhs.is_featured == rhs.is_featured &&
            lhs.featured_position == rhs.featured_position &&
            lhs.featured_image == rhs.featured_image &&
            lhs.price == rhs.price &&
            lhs.m_product_opens == rhs.m_product_opens &&
            lhs.m_product_close == rhs.m_product_close &&
            lhs.e_product_opens == rhs.e_product_opens &&
            lhs.e_product_close == rhs.e_product_close &&
            lhs.pure_veg == rhs.pure_veg &&
            lhs.discount == rhs.discount &&
            lhs.discount_type == rhs.discount_type &&
            lhs.addons == rhs.addons &&
            lhs.addons_cat == rhs.addons_cat &&
            lhs.addons_price == rhs.addons_price &&
            lhs.status == rhs.status &&
            lhs.create_date == rhs.create_date &&
            lhs.modefied_date == rhs.modefied_date &&
            lhs.modefied_date == rhs.modefied_date
        }
    }

}
