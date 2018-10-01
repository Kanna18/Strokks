//
//  AddressViewController.swift
//  Storkks
//
//  Created by Gaian on 30/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class AddressViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func addressButtonClick(_ sender: Any) {
    }
    @IBOutlet weak var addressBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        
        tableView.register(UINib.init(nibName: "AddressCell", bundle: nil), forCellReuseIdentifier: "addressCell")
        
        addressBtn.layer.borderColor = UIColor.green.cgColor
        addressBtn.layer.borderWidth = 1.0
        addressBtn.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - TableView Delegates
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return 10
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:AddressCell? = tableView.dequeueReusableCell(withIdentifier: "addressCell", for: indexPath) as? AddressCell
        cell?.LblAddress.text = "plot no91, lig 203/4, K P H B phase1,\nKukatpally, Hyderabad, Telangana 500072\nIndia, nearVenkateswara aiyengar bakery"
        cell?.LblAddress.numberOfLines = 3
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
        return 110
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
