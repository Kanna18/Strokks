//
//  ButtonWithImage.swift
//  Storkks
//
//  Created by gaian  on 8/14/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class ButtonWithImage: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
//        if imageView != nil {
//            imageEdgeInsets = UIEdgeInsets(top: 5, left:5 , bottom: 5, right: (bounds.width - 35))
//            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
//        }
    }

}
