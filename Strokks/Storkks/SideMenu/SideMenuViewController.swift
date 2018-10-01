//
//  SideMenuViewController.swift
//  Storkks
//
//  Created by gaian  on 8/10/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArra : Array<Any>?
    var sectionArr : [String] = ["Offers","Pure Veg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCusineList()
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        // Do any additional setup after loading the view.

    }
    
    func getCusineList() {
        let urlString = "\(ServiceDataConst.kCuisin)"
        let restURL = URL(string: urlString)
        var request = URLRequest(url: restURL!)
        let postBody = "{}"
        request.httpBody = postBody.data(using: .utf8)
        StorksWebserviceCalls().sendPOST(request, withSuccess: { data in
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            guard let sideMenuData = try? JSONDecoder().decode(SideMenuData.CusinsData.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return                
            }
            self.dataArra = sideMenuData.cuisins
            self.tableView.perform(#selector(self.tableView.reloadData), on: .main, with: nil, waitUntilDone: true)
        }, withFailure: { error in
        })        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return sectionArr.count
        }
        if section == 1
        {
            guard let count = dataArra?.count else{
                return 0
            }
            return count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell")
        
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "sideMenuCell")
        }
        if indexPath.section == 0{
            cell?.textLabel?.text = sectionArr[indexPath.row]
        }
        if indexPath.section == 1{
            let cusineDetail = dataArra![indexPath.row] as! SideMenuData.Cuisins
            cell?.textLabel?.text = cusineDetail.name
        }
        cell?.selectionStyle = .none
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark{
            cell?.accessoryType = .none
        }else{
            cell?.accessoryType = .checkmark
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0 {
        return " SHOW RESTAURANTS WITH"
        }
        if section == 1 {
            return "CUSINES"
        }
        return ""
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44
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
