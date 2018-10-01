//
//  DetailsHeaderView.swift
//  Storkks
//
//  Created by Gaian on 18/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class DetailsHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var headerTapButton: UIButton!
    var categoryData : CategoriesData.Category? = nil
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
