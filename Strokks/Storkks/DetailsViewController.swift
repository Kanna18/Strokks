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
    @IBOutlet weak var windowSubView: UIView!
    @IBOutlet weak var menuTableViewSub: UITableView!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var windowView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var tblCategory: UITableView!
    @IBOutlet weak var topView: TopView!
    var imagePath : String = ""
    var shop: RestaurantsData.shop?
    let sectionDetailCellOne = 0
    let sectionDetailCell = 1
    var count = 0
    var categoriesArray : [CategoriesData.Category]? = nil
    public var restaurantDetails : RestaurantsData.shop?
    var subListDict = Dictionary<Int, [CategoriesSubList.Product]>()
    var selectedSectionsArray = [Int]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        tblCategory.register(UINib.init(nibName: "DetailsCellOne", bundle: nil), forCellReuseIdentifier: "detailsCellOne")
        tblCategory.register(UINib.init(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "detailsCell")
        tblCategory.register(UINib.init(nibName: "DetailsHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "detailsHeaderView")
        tblCategory.separatorStyle = .none
        
        windowSubView.layer.cornerRadius = 10.0
        windowSubView.clipsToBounds = true
        windowSubView.layer.borderWidth = 1.0
        windowSubView.layer.borderColor = UIColor.white.cgColor
        
        
        windowView.isHidden = true
//        tblCategory.register(UINib.init(nibName: "SubMenuCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "subMenuCell")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.2) {
         // self.tabBarController?.tabBar.isHidden = true
        };

        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imgView.sd_setImage(with: URL(string: imagePath), placeholderImage: UIImage(named: "placeholder.png"))
        self.getCategoriesList()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeSubMenuButton(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.windowView.isHidden = true
            self.floatingButton.isHidden = false
        }
    }
    
    @IBAction func floatingBtnClick(_ sender: Any) {
        
        UIView.animate(withDuration: 0.3) {
            self.windowView.isHidden = false
            self.floatingButton.isHidden = true
        }
    }
    //MARK: Tableview methods

    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == menuTableViewSub {
            return 1
        }
        
        if tableView == tblCategory {
            guard let myCount = categoriesArray?.count  else {
                return 1
            }
            return myCount + 1
        }
        
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == menuTableViewSub {
            guard let myCount = categoriesArray?.count  else {
                return 0
            }
            return myCount
        }
        
        if tableView == tblCategory {
            
            if section == sectionDetailCellOne
            {
                return 1
            }
            else
            {
                if selectedSectionsArray.contains(section)
                {
                    guard subListDict != nil else {
                        return 0
                    }
                    guard let number = subListDict[section] else{
                        return 0
                    }
                    return number.count
                }else{
                    return 0
                }
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == menuTableViewSub {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCellRightDetail", for: indexPath)
            let headerData = categoriesArray![indexPath.row]
            cell.textLabel?.text = headerData.cat_name
            cell.detailTextLabel?.text = "\(headerData.cat_order)"
            return cell
        }
        
        if tableView == tblCategory {
            
            if indexPath.section == sectionDetailCellOne
            {
                //            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCellOne", for: indexPath) as? DetailsCellOne
                let cell = Bundle.main.loadNibNamed("DetailsCellOne", owner: self, options: nil)?[0] as! DetailsCellOne
                cell.selectionStyle = .none
                cell.getRestaurantData(rest: restaurantDetails!)
                return cell
            }
            else
            {
                //            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as? DetailsCell
                let cell = Bundle.main.loadNibNamed("DetailsCell", owner: self, options: nil)?[0] as! DetailsCell
                cell.selectionStyle = .none
                cell.getProductData(pro: subListDict[indexPath.section]![indexPath.row])
                return cell
            }

        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        if tableView == menuTableViewSub {
            let btn = UIButton.init()
            btn.tag = indexPath.row
            self.getSubListForCategry(btn: btn)
            self.closeSubMenuButton(btn)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        if tableView == tblCategory {
            
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "detailsHeaderView") as! DetailsHeaderView
            let headerData = categoriesArray![section-1]
            header.headerTapButton.tag = section-1
            header.headerTapButton.addTarget(self, action: #selector(getSubListForCategry(btn:)), for: .touchUpInside)
            header.categoryLabel.text = headerData.cat_name
            header.backgroundColor = UIColor.green
            if selectedSectionsArray.contains(section){
                header.headerTapButton.isSelected = true
            }else{
                header.headerTapButton.isSelected = false
            }
            
            
            return header
        }
        return nil
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if tableView == tblCategory {
            let view = UIView.init(frame: CGRect.zero)
            view.backgroundColor = UIColor.white
            return view
        }
        
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == tblCategory {
            if section == sectionDetailCellOne {
                return 0
            }else{
                return 60
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if tableView == tblCategory{
            if section == sectionDetailCellOne{
                return 10
            }else{
                return 10
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        if tableView == menuTableViewSub{
            
            return 44
        }
        
        if tableView == tblCategory {
            if indexPath.section == sectionDetailCellOne
            {
                return 180
            }
            return 50
        }
        return 0
    }
    func getCategoriesList() {
        let urlString = "\(ServiceDataConst.krestaurantCategory)" + "/" + (restaurantDetails?.id)!
        let restURL = URL(string: urlString)
        var request = URLRequest(url: restURL!)
        let postBody = "{}"
        request.httpBody = postBody.data(using: .utf8)
        StorksWebserviceCalls().sendPOST(request, withSuccess: { data in
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            guard let categoriesData = try? JSONDecoder().decode(CategoriesData.Categories.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            self.categoriesArray = categoriesData.categories
            self.tblCategory.perform(#selector(self.tblCategory.reloadData), on: .main, with: nil, waitUntilDone: true)
            self.menuTableViewSub.perform(#selector(self.menuTableViewSub.reloadData), on: .main, with: nil, waitUntilDone: true)
        }, withFailure: { error in
        })
    }
    @objc func getSubListForCategry(btn:UIButton) {
        
        if selectedSectionsArray.contains(btn.tag+1){
            selectedSectionsArray.remove(at: selectedSectionsArray.index(of: btn.tag+1)!)
        }else{
            selectedSectionsArray.append(btn.tag+1)
        }
        if (subListDict[btn.tag+1]) != nil{
             self.perform(#selector(self.tableViewReload(btn:)), on: .main, with: btn, waitUntilDone: true)
        }else{
            let headerData = categoriesArray![btn.tag]
            let urlString = "\(ServiceDataConst.kShopItemsBycatURL)"
            let restURL = URL(string: urlString)
            var request = URLRequest(url: restURL!)
            let json = ["catid": (restaurantDetails?.id)!,"rid":(headerData.id)]
            let postBody = json.description
            request.httpBody = postBody.data(using: .utf8)
            StorksWebserviceCalls().sendPOST(request, withSuccess: { data in
                guard let data = data else {
                    print("Error: No data to decode")
                    return
                }
                guard let categoriesSublistData = try? JSONDecoder().decode(CategoriesSubList.SubList.self, from: data) else {
                    print("Error: Couldn't decode data into Blog")
                    return
                }
                let subLis = categoriesSublistData.products
                DispatchQueue.main.async { // Make sure you're on the main thread here
                    self.subListDict[btn.tag+1] = subLis
                    self.perform(#selector(self.tableViewReload(btn:)), on: .main, with: btn, waitUntilDone: true)
                }
            }, withFailure: { error in
                print(error?.localizedDescription as Any)
            })
        
        }
        
    }
    
    @objc func tableViewReload(btn:UIButton){
        self.tblCategory.reloadSections(IndexSet.init(integer: btn.tag+1), with: .automatic)
        if(selectedSectionsArray.contains(btn.tag+1)){
            self.tblCategory.scrollToRow(at: IndexPath.init(row: 0, section: btn.tag+1), at: UITableViewScrollPosition.top, animated: true)
        }
        menuTableViewSub.reloadData()
//        self.tblCategory.reloadData()
    }
}
