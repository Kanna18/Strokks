//
//  SampleViewController.swift
//  Storkks
//
//  Created by Gaian on 30/09/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit

class SampleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var sampleTV: UITableView!
    
    @IBOutlet weak var sampleTV2: UITableView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == sampleTV2{
        return 1
        }
        if tableView == sampleTV{
            return 1
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == sampleTV2{
            return 3
        }
        if tableView == sampleTV{
            return 2
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == sampleTV{
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        // Configure the cell...
        return cell
        }
        
        if tableView == sampleTV2{
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCellRightDetail", for: indexPath)
        // Configure the cell...
        return cell
        }
        
        return UITableViewCell()
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
