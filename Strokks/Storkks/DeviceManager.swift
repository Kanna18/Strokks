//
//  DeviceManager.swift
//  Strokks
//
//  Created by gaian  on 8/2/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class DeviceManager: NSObject {
    
    static func deviceUUID() -> String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }
    
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    static func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    static func setStatusBarBackgroundColor(_ color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
    
}
