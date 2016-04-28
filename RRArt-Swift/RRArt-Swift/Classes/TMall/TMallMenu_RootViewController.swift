//
//  TMallMenu_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/28.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class TMallMenu_RootViewController: YZDisplayViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpContentViewFrame { (contentView) in
            contentView.frame = CGRectMake(0, 64,UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-64-40)
        }
        
        titleFont = UIFont.systemFontOfSize(15)
        norColor = UIColor.blackColor()
        selColor = UIColor.orangeColor()
        
        isShowUnderLine = true
        underLineColor = UIColor.orangeColor()
        underLineH = 2
    
        for tmallhome in CTmallHomeModel.getTmallHomeArray(){
            let tmallVc = TMallHomeViewController(shopType: tmallhome)
            tmallVc.title = tmallhome.name
            
            addChildViewController(tmallVc)
        }
 
    }

}
