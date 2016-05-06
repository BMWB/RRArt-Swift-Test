//
//  Lesson_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

private let cellID = "Lesson_RootViewController"

class Lesson_RootViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orangeColor()
        view.addSubview(lessonHomeTableView)
       
    }

      
    
    lazy var  lessonHomeTableView :BaseTableView = {
    
        let tableView = BaseTableView(frame:self.view.bounds, style: UITableViewStyle.Plain) 
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerNib(UINib(nibName:"LessonHomeTableViewCell" ,bundle: nil), forCellReuseIdentifier: cellID)
        tableView.rowHeight = 118
        return tableView
    }()
}

extension Lesson_RootViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let  cell = tableView.dequeueReusableCellWithIdentifier(cellID) as! LessonHomeTableViewCell
    
        return cell
    }
}