//
//  ShopDetailsView.swift
//  Storkks
//
//  Created by gaian  on 8/14/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class ShopDetailsView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var switchVeg: UISwitch!
    @IBOutlet weak var lblDiscountDetails: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var btnCost: UIButton!
    @IBOutlet weak var btnDuration: UIButton!
    @IBOutlet weak var btnRating: UIButton!
    @IBOutlet weak var lblShopName: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadFromNib()
    }
    
    
    private func loadFromNib()
    {
        Bundle.main.loadNibNamed("ShopDetailsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor.red
        // UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
    }
}
