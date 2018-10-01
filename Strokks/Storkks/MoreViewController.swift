//
//  MoreViewController.swift
//  Strokks
//
//  Created by gaian  on 8/6/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class MoreViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate,UITabBarControllerDelegate {

    @IBOutlet weak var tblMore: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblHeader: UIView!
    let arrSource = ["Home","Addresses","Orders","Favorites","Offers","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblMore.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        self.displayRegistration()
        if indexPath.row == 0{
            self.tabBarController?.selectedIndex = 0
        }
        if indexPath.row == 1{
            self.navigationController?.popToRootViewController(animated: true)
        }
        if indexPath.row == 1{
            self.loadAddressVC()
        }
        if indexPath.row == 2{
            self.loadOrdersVC()
        }
        if indexPath.row == 3{
            self.loadFavouritesVC()
        }
        if indexPath.row == 4{
            self.loadOffersTableVC()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSource.count;
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "moreCell", for: indexPath)
        if cell == nil
        {
            cell = UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = arrSource[indexPath.row]
        cell.imageView?.image = UIImage(named: arrSource[indexPath.row] )
        
        cell.selectionStyle = UITableViewCellSelectionStyle.default
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44
    }
    func displayRegistration()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let regView = RegistrationView.init(frame: CGRect(x: 0, y: 0, width: (appDelegate.window?.frame.size.width)!, height:  (appDelegate.window?.frame.size.height)!))
        appDelegate.window?.addSubview((regView))
        regView.alpha = 0
        regView.isHidden = true
        regView.backgroundColor = UIColor.red
        UIView.animate(withDuration: 0.3, delay: 0, options: .transitionCrossDissolve, animations: {
            regView.isHidden = false
            regView.alpha = 1
        }, completion: nil)
    }
    func loadOffersTableVC(){
        let offer = self.storyboard?.instantiateViewController(withIdentifier: "offersTVC") as! OffersTableViewController        
        self.navigationController?.pushViewController(offer, animated: true)
    }
    func loadAddressVC(){
        let address = self.storyboard?.instantiateViewController(withIdentifier: "addressVC") as! AddressViewController
        self.navigationController?.pushViewController(address, animated: true)
    }
    func loadOrdersVC(){
        let orders = self.storyboard?.instantiateViewController(withIdentifier: "ordersVC") as! OrdersViewController
        self.navigationController?.pushViewController(orders, animated: true)
    }
    func loadFavouritesVC(){
        let favourites = self.storyboard?.instantiateViewController(withIdentifier: "favoutitesVC") as! FavoutitesViewController
        self.navigationController?.pushViewController(favourites, animated: true)
    }
    
    
}
