//
//  MMViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/5.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import MMDrawerController

class MMViewController: MMDrawerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let centerVc = Lesson_RootViewController()
        let leftVC   = MyZone_RootViewController()
        centerViewController = centerVc
        leftDrawerViewController = leftVC
        maximumLeftDrawerWidth = kScreen_Width
        shouldStretchDrawer = false
        
        openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
    
    }


}
