//
//  DetailsViewController.swift
//  Storkks
//
//  Created by gaian  on 8/14/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tblCategory: UITableView!
    @IBOutlet weak var topView: TopView!
    var imagePath : String = ""
    var shop: RestaurantsData.shop?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imgView.sd_setImage(with: URL(string: imagePath), placeholderImage: UIImage(named: "placeholder.png"))
        self.getCategoriessData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 1
        }
        else
        {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellItem", for: indexPath)
        if cell == nil
        {
            cell = UITableViewCell()
        }
        if indexPath.section == 0
        {
            let details = ShopDetailsView.init(frame: CGRect(x: 0, y: 0, width:cell.contentView.frame.size.width, height: 180))
            details.lblShopName.text = shop?.name
            cell.contentView.addSubview(details)
        }
            
        else
        {
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
       
        return " Restaurants"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.section == 0
        {
            return 180
        }
        return 44
    }
    private func getCategoriessData()
    {
        let urlString = "\(ServiceDataConst.kShopsCatURL)"+"\(String(describing: (shop?.id)!))"
        let restURL = URL(string: urlString)
        var request = URLRequest(url: restURL!)
        let postBody = "{}"
        request.httpBody = postBody.data(using: .utf8)
        StorksWebserviceCalls().sendPOST(request, withSuccess: { data in
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            guard let category = try? JSONDecoder().decode(CategoriesData.Categories.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            
            print("blog title: \(category.count)")
            
            print("articles:")
            for cat in category.categories {
                print("- \(cat.restaurant_name)")
            }
//            self.shopsData = NSMutableDictionary()
//            self.shopsData? .setValue(restaurants.count, forKey: "total")
//            self.shopsData? .setValue(restaurants.path, forKey: "path")
//            self.shopsData? .setValue(restaurants.list, forKey: "list")
//            print("blog home:", self.shopsData as Any)
//            DispatchQueue.main.async {
//                self.tblRestaurants.reloadData()
//            }
            
        }, withFailure: { error in
        })
    }
}
