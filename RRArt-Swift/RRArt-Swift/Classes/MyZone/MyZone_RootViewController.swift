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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MyZoneTableView)
    }

    lazy var  MyZoneTableView :BaseTableView = {
        
        let tableView = BaseTableView(frame:self.view.bounds, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.registerNib(UINib(nibName:"LessonHomeTableViewCell" ,bundle: nil), forCellReuseIdentifier: cellID)
//        tableView.rowHeight = 118
        return tableView
    }()

    
}

extension MyZone_RootViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        
        cell?.textLabel?.text = "王天骥"
        return cell!
    }
}
