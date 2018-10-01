//
//  OrdersCell.swift
//  sampleAPPContent
//
//  Created by gaian  on 8/1/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class OrdersCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var LblResName: LabelClass!
    @IBOutlet weak var LblResLocation: LabelClass!
    @IBOutlet weak var LblItems: LabelClass!
    @IBOutlet weak var LblOrderTime: LabelClass!
    @IBOutlet weak var LblCost: LabelClass!
    @IBOutlet weak var LblOrderStatus: LabelClass!
    @IBOutlet weak var LblRating: LabelClass!
    @IBOutlet weak var LblStar: LabelClass!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgView.layer.cornerRadius = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.baseView.dropShadow(color: .lightGray, opacity: 1, offSet: CGSize.init(width: -1, height: -1), radius: 3, scale: true)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
       
    }
    
    private func setupShadow() {
        baseView.layer.cornerRadius = 8
        baseView.layer.shadowOffset = CGSize(width: 0, height: 3)
        baseView.layer.shadowRadius = 3
        baseView.layer.shadowOpacity = 0.3
        baseView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        baseView.layer.shouldRasterize = true
        baseView.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension UIView {
    
    
    func shadowWithAnotherView(viewParent:UIView)  {
        let viewShadow = UIView(frame: CGRect(x: 0, y: 0, width: viewParent.frame.width, height: viewParent.frame.height))
        viewShadow.center = viewParent.center
        viewShadow.backgroundColor = UIColor.yellow
        viewShadow.layer.shadowColor = UIColor.red.cgColor
        viewShadow.layer.shadowOpacity = 1
        viewShadow.layer.shadowOffset = CGSize.zero
        viewShadow.layer.shadowRadius = 5
        viewParent.addSubview(viewShadow)

    }
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = false
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
