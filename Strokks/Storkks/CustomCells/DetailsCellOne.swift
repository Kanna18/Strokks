//
//  DetailsCellOne.swift
//  Storkks
//
//  Created by Gaian on 18/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class DetailsCellOne: UITableViewCell {
    @IBOutlet weak var deliveryTimeLabel: UIButton!
    @IBOutlet weak var ratingsLabel: UIButton!
    @IBOutlet weak var costForTowLabel: UIButton!
    @IBOutlet weak var discountDiscriptionLabel: UILabel!
    
    @IBOutlet weak var vegSwitch: UISwitch!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var totalRatingsLabel: UILabel!
    var  restaurantDetails : RestaurantsData.shop?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillLabels(){
        self.restaurantNameLabel.text = restaurantDetails?.name
        self.deliveryTimeLabel.setTitle((restaurantDetails?.estimated_delivery_time)!+" MINS", for: .normal)
        self.discountDiscriptionLabel.text = (restaurantDetails?.offer_percentage)!+"% "+(restaurantDetails?.offertitle)!+" "+(restaurantDetails?.min_amount_offer)!
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func getRestaurantData(rest :  RestaurantsData.shop) {
        restaurantDetails = rest
        self.fillLabels()
    }
    
}
