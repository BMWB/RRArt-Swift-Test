//
//  MMViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/5.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import MMDrawerController

let MMLeftVc_width = kScreen_Width - 200

class MMViewController: MMDrawerController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftVC   = GET_SB("LeftVc").instantiateViewControllerWithIdentifier("MyZone_RootViewController") as! MyZone_RootViewController
        leftVC.mainVC = self
        
        centerViewController = centerVc
        leftDrawerViewController = leftVC
        maximumLeftDrawerWidth = MMLeftVc_width
        shouldStretchDrawer = false
        
        openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
        
    }
    
    
    lazy var centerVc :BaseNavigationViewController = {
        
        let orgModel = COrgListModels()
        orgModel.Id = 1
        orgModel.Name = "每日推荐"
        
        let centerVc = Lesson_RootViewController()
        centerVc.orglist = orgModel
        let centerNav = BaseNavigationViewController(rootViewController: centerVc)
        
        
        return centerNav
    }()
}
