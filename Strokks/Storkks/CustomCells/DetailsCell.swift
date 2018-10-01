//
//  DetailsCell.swift
//  Storkks
//
//  Created by Gaian on 18/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    var cartCount = 0
    var productItem : CategoriesSubList.Product?
    var cartC = CartClass()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func decrement(_ sender: Any) {
        self.addOrRemoveFromCart(val: "d")
    }
    @IBAction func increment(_ sender: Any) {
        self.addOrRemoveFromCart(val: "i")
    }
    
    func addOrRemoveFromCart(val : String){
        
        var count = cartC.quantity
        if val == "i" && count >= 0 {
            count = count + 1
        }
        if val == "d" && count >= 1 {
            count = count - 1
        }
        if(count == 0){
            addBtn.isHidden = false
            StorkksSharedClass.shared.cartArray.remove(at: StorkksSharedClass.shared.cartArray.index(of: cartC)!)
        }
        cartC.quantity = count
        countLabel.text = count.description
        
    }
    
    @IBAction func addClick(_ sender: Any) {
        
        StorkksSharedClass.shared.cartArray.append(cartC)
        UIView.animate(withDuration: 0.3) {
            self.addBtn.isHidden = true
        }
        cartC.quantity = 1
        countLabel.text = cartC.quantity.description
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
//        cartCount = 0
//        self.addBtn.isHidden = false
//        countLabel.text = cartCount.description
    }
    func getProductData(pro : CategoriesSubList.Product) {
        
        baseView.layer.cornerRadius = 1.0
        baseView.layer.borderWidth = 1.0
        baseView.layer.borderColor = UIColor.lightGray.cgColor        
        subLabel.text = pro.product_name
        self.productItem = pro
        
        cartC.product_id = (productItem?.id)!
        cartC.product_name = (productItem?.product_name)!
        cartC.product_price = (productItem?.price)!
        cartC.quantity = 0
    }
    
    
    
    
}
