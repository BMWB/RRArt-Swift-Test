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
    
    
    @IBOutlet weak var myZoneTabView: UITableView!
    
    weak var mainVC : MMViewController!
    
    var myZoneArray :[COrgListModels]?{
        didSet{
            myZoneTabView.reloadData()
            
            /// 默认选择第0个
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            myZoneTabView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTablvView()
        loadData()
        
    }
    
    func setTablvView()  {
        headerView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        footerView.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        myZoneTabView.dataSource = self
        myZoneTabView.delegate = self
        myZoneTabView.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
        myZoneTabView.separatorStyle = UITableViewCellSeparatorStyle.None
        
        //去掉下部空白格
        myZoneTabView.tableFooterView = UIView()

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
