//
//  SideMenuData.swift
//  Storkks
//
//  Created by Gaian on 17/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class SideMenuData: NSObject {
    
    struct CusinsData: Decodable{
        let total_cuisins: Int?
        let status: Bool?
        let cuisins: [Cuisins]?

        enum CodingKeys: String,CodingKey  {
            case total_cuisins
            case status
            case cuisins
        }
    }
    struct Cuisins: Decodable {
        let id : String?
        let name : String?
        let create_date : String?
        let modified_date : String?
        let status : String?
        
        enum CodingKeys: String,CodingKey {
            case id, name,create_date, modified_date, status
        }
    }
    
}
