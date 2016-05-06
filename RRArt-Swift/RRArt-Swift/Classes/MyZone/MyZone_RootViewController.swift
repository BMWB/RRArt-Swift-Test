//
//  MyZone_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

private let cellID = "MyZone_RootViewController"
class MyZone_RootViewController: BaseViewController {
    weak var mainVC : MMViewController!
    
    var myZoneArray :[COrgListModels]?{
        didSet{
            MyZoneTableView.reloadData()
            
            /// 默认选择第0个
            let indexPath = NSIndexPath(forRow: 0, inSection: 0)
            MyZoneTableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: .None)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MyZoneTableView)
        
        loadData()
    }
    
    
    private func  loadData(){
        
        CAlamofireManager.shareTools.lessonOrgsListRequestData { (responseObject) in
            
            let models = COrgListModels.objectArrayWithKeyValuesArray(responseObject as! [[String:AnyObject]])
            
            
            self.myZoneArray = models
            debugPrint(models)
            
        }
        
    }
    
    
    lazy var  MyZoneTableView :BaseTableView = {
        
        let tableView = BaseTableView(frame:CGRectMake(0, 0, MMLeftVc_width, self.view.bounds.height), style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.registerNib(UINib(nibName:"LessonHomeTableViewCell" ,bundle: nil), forCellReuseIdentifier: cellID)
        //        tableView.rowHeight = 118
        return tableView
    }()
    
    
}

extension MyZone_RootViewController:UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myZoneArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        
        let myzone = self.myZoneArray![indexPath.row]
        
        cell?.textLabel?.text = myzone.Name
        return cell!
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
