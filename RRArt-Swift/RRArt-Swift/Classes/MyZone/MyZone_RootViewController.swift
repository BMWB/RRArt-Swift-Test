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
    
    var myZoneArray :[COrgListModels]?{
        didSet{
            MyZoneTableView.reloadData()
            
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

extension MyZone_RootViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myZoneArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        let myzone = self.myZoneArray![indexPath.row]
        
        cell?.textLabel?.text = myzone.Name
        return cell!
    }
}
