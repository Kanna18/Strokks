//
//  StorkksSharedClass.swift
//  Storkks
//
//  Created by Gaian on 20/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class StorkksSharedClass: NSObject {
    
    
    private override init() { }
    // Can't init is singleton

    // MARK: Shared Instance
    static let shared = StorkksSharedClass()
    
    // MARK: Local Variable
    var cartArray = [CartClass]()
    

}
