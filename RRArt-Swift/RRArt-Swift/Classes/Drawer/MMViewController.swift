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
        let centerVc = Lesson_RootViewController()
        let leftVC   = MyZone_RootViewController()
        centerViewController = centerVc
        leftDrawerViewController = leftVC
        maximumLeftDrawerWidth = MMLeftVc_width
        shouldStretchDrawer = false
        
        openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
    
    }


}
