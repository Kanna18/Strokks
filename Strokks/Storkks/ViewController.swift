//
//  ViewController.swift
//  Strokks
//
//  Created by gaian  on 8/2/18.
//  Copyright © 2018 gaian . All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var sideMenuBarBtn: UIBarButtonItem!
    @IBOutlet weak var tblRestaurants: UITableView!
    @IBOutlet weak var promoScrollView: UIScrollView!
    var bannerScrollView: UIScrollView!
    var pageControl: UIPageControl!
    private var bannerHeight: CGFloat = 0.0
    var autoScrollTimer: Timer!
    var isTimerPaused: Bool!
    var promotionArray: [[String : Any?]]?
    var promotionViewArray: [DealBannerView]!
    var shopsData : NSMutableDictionary?
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            sideMenuBarBtn.target = self.revealViewController()
            sideMenuBarBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.revealViewController().delegate = self as! SWRevealViewControllerDelegate
            
            // Loading Side Menu; To Subscribing: kInvalidUserNotification
//            if let menuVC = self.revealViewController().rearViewController as? SideMenuVC  {
//                Log.print("Loading Side Menu View: ", menuVC.view,  "For Subscribing: kInvalidUserNotification ")
//            }
        }
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "ItemDetailsCell", bundle: nil)
        self.tblRestaurants .register(nib, forCellReuseIdentifier: "ItemDetailsCell")
        self.showPromotionView()
        self.getRestaurantsData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func showPromotionView() {
        guard let promotionViewArray = promotionViewArray else {
            self.bannerHeight = 100.0
            return
        }
        let screenWidth = Int(DeviceManager.screenWidth())
        bannerScrollView = UIScrollView()
        bannerScrollView.backgroundColor = UIColor.clear
        bannerScrollView.frame = CGRect(x: 0, y: 2, width: screenWidth, height: Int(bannerHeight))
        bannerScrollView.contentSize = CGSize(width: screenWidth*promotionViewArray.count, height: Int(bannerHeight))
        bannerScrollView.isPagingEnabled = true
        bannerScrollView.showsHorizontalScrollIndicator = false
        bannerScrollView.delegate = self
        DispatchQueue.main.async {
            self.view.addSubview(self.bannerScrollView)
        }
        
        var xPosition: Double = 0.0
        var imageTag = 1
        
        for promoView in promotionViewArray {
            promoView.frame = CGRect(x: xPosition, y: 0.0, width: Double(screenWidth), height: Double(bannerHeight))
            promoView.tag = imageTag
            DispatchQueue.main.async {
                self.bannerScrollView.addSubview(promoView)
            }
            
            xPosition += Double(screenWidth)
            imageTag += 1
        }
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoScrollBanners(_:)), userInfo: nil, repeats: true)
        
        //Configure page control
        self.showPageControl()
    }
    private func showPageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        pageControl.center = CGPoint(x: bannerScrollView.center.x, y: bannerScrollView.frame.maxY - 20 )
        pageControl.currentPageIndicatorTintColor = UIColor.brown
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.isUserInteractionEnabled = false
        pageControl.numberOfPages = 4
       // pageControl.numberOfPages = promotionViewArray.count
        pageControl.isHidden = false
        
        DispatchQueue.main.async {
            self.view.addSubview(self.pageControl)
        }
    }
    @objc func autoScrollBanners(_ timer: Timer) {
        guard let isTimerPaused = isTimerPaused, isTimerPaused == false else { return }
        
        let screenWidth = Int(DeviceManager.screenWidth())
        let maxAllowedOffset = (screenWidth * promotionViewArray.count) - screenWidth
        let currentOffset = bannerScrollView.contentOffset.x
        
        if Int(currentOffset) < maxAllowedOffset {
            //scroll to desire position
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.5, animations: {
                    let point = CGPoint(x: Int(currentOffset) + screenWidth, y: 0)
                    self.bannerScrollView.setContentOffset(point, animated: false)
                })
            }
        }
        
        if Int(currentOffset) == maxAllowedOffset {
            DispatchQueue.main.async{
                self.bannerScrollView.setContentOffset(CGPoint.zero, animated: false)
            }
        }
    }
    //MARK: Tableview methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! DetailsViewController
        let list = self.shopsData?.value(forKey:"list") as? NSArray
        let shop = list![indexPath.row] as? RestaurantsData.shop
        let baseURL = self.shopsData?.value(forKey:"path") as? String
        let imageURL = baseURL! + (shop?.shop_logo)!
        detailsVC.imagePath = imageURL
        detailsVC.shop = shop
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let list = self.shopsData?.value(forKey: "list") as? NSArray else {
            print("Error: No data to decode")
            return 0
        }
        let lists = self.shopsData?.value(forKey: "list") as! NSArray
        return lists.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:ItemDetailsCell? = tableView.dequeueReusableCell(withIdentifier: "ItemDetailsCell", for: indexPath) as? ItemDetailsCell
        if cell == nil
        {
            cell = ItemDetailsCell()
        }
        
        cell?.selectionStyle = UITableViewCellSelectionStyle.default
        let list = self.shopsData?.value(forKey:"list") as? NSArray
        let shop = list![indexPath.row] as? RestaurantsData.shop
        cell?.LblName.text =  shop?.name
        cell?.LblInfo.text = shop?.description
        cell?.LblDuration.text = (shop?.estimated_delivery_time)! + " MIN"
        let baseURL = self.shopsData?.value(forKey:"path") as? String
        let imageURL = baseURL! + (shop?.shop_logo)!
        cell?.imgView.sd_setImage(with: URL(string: imageURL), placeholderImage: UIImage(named: "placeholder.png"))
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        guard let list = self.shopsData?.value(forKey: "list") as? NSArray else {
            print("Error: No data to decode")
            return ""
        }
        let lists = self.shopsData?.value(forKey: "list") as! NSArray
        return "\(String(describing: lists.count))" + " Restaurants"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    private func getRestaurantsData()
    {
        let restURL = URL(string: ServiceDataConst.kShopsURL)
        var request = URLRequest(url: restURL!)
        let postBody = "{}"
        request.httpBody = postBody.data(using: .utf8)
        StorksWebserviceCalls().sendPOST(request, withSuccess: { data in
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            guard let restaurants = try? JSONDecoder().decode(RestaurantsData.Shops.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
           
            print("blog title: \(restaurants.count)")
            print("blog home: \(restaurants.path)")
            
            print("articles:")
            for shop in restaurants.list {
                print("- \(shop.name)")
            }
            self.shopsData = NSMutableDictionary()
            self.shopsData? .setValue(restaurants.count, forKey: "total")
            self.shopsData? .setValue(restaurants.path, forKey: "path")
            self.shopsData? .setValue(restaurants.list, forKey: "list")
            print("blog home:", self.shopsData as Any)
            DispatchQueue.main.async {
                self.tblRestaurants.reloadData()
            }
            
        }, withFailure: { error in
        })
    }
}

extension ViewController : SWRevealViewControllerDelegate {
    func revealController(_ revealController: SWRevealViewController!, didMoveTo position: FrontViewPosition) {
        if position == .left {
//            if let bannerScrollView = bannerScrollView {
//                bannerScrollView.isUserInteractionEnabled = true
//            }
//            if let menuCard = menuCard {
//                menuCard.isUserInteractionEnabled = true
//            }
        }else{
//            if let bannerScrollView = bannerScrollView {
//                bannerScrollView.isUserInteractionEnabled = false
//            }
//            if let menuCard = menuCard {
//                menuCard.isUserInteractionEnabled = false
//            }
        }
    }
}
