//
//  MyZone_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

private let cellID = "MyZoneleftCell"

class MyZone_RootViewController: BaseViewController {
    
    @IBOutlet weak var headerView: UIView!
    
    @IBOutlet weak var footerView: UIView!
    
    @IBOutlet weak var headImage: UIButton!
    
    @IBOutlet weak var myZoneTabView: UITableView!
    
    @IBOutlet weak var selectBtn: ImageTextButton!
    
    weak var mainVC : MMViewController!
    
    var myZoneArray :[COrgListModels]?{
        didSet{
            myZoneTabView.reloadData()
            
            /// 默认选择第0个
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            myZoneTabView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        }
        
    }
    
    @IBAction func loginMth(sender: AnyObject) {
        
        debugPrint("点击登录")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTablvView()
        loadData()
        
    }
    
    func setTablvView()  {
        headerView.backgroundColor = WTJRGB(35, 42, 48)
        footerView.backgroundColor = WTJRGB(35, 42, 48)
        
        myZoneTabView.dataSource = self
        myZoneTabView.delegate = self
        myZoneTabView.backgroundColor = WTJRGB(35, 42, 48)
        myZoneTabView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        //去掉下部空白格
        myZoneTabView.tableFooterView = UIView()

        
        selectBtn.buttonTitleWithImageAlignment = UIButtonTitleWithImageAlignmentUp
        
        headImage.layer.masksToBounds = true
        headImage.layer.cornerRadius = headImage.bounds.size.height/2
    }
    
    private func  loadData(){
        
        CAlamofireManager.shareTools.lessonOrgsListRequestData { (responseObject) in
            
            let models = COrgListModels.objectArrayWithKeyValuesArray(responseObject as! [[String:AnyObject]])
            
            
            self.myZoneArray = models
            debugPrint(models)
            
        }
        
    }
    
}

extension MyZone_RootViewController:UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myZoneArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as! MyZone_leftCell
        
        let myzone = self.myZoneArray![indexPath.row]
        cell.org = myzone
        return cell
    }
    
}


extension MyZone_RootViewController:UITableViewDelegate{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let myzone = self.myZoneArray![indexPath.row]
        
        let centerVc = Lesson_RootViewController()
        centerVc.orglist = myzone
        let centerNav = BaseNavigationViewController(rootViewController: centerVc)
        
        print(self.mainVC)
        self.mainVC.setCenterViewController(centerNav, withCloseAnimation: true, completion: nil)
    }
}
