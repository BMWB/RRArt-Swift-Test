//
//  MainViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.orangeColor()
        
        addChildViewController(Comment_RootViewController(), title: "点评", imageName: "tab_ques")
        addChildViewController(Lesson_RootViewController(), title: "精选", imageName: "xiadaohang_icon_kecheng")
        addChildViewController(WebSchool_RootViewController(), title: "网校", imageName: "xiadaohang_icon_wangxiao")
        addChildViewController(TMall_RootViewController(), title: "商城", imageName: "xiadaohang_icon_shangcheng")
        addChildViewController(MyZone_RootViewController(), title: "我的", imageName: "tab_me")
        
    }

    private func addChildViewController(childController: UIViewController,title:String,imageName:String) {
        childController.tabBarItem.image = UIImage(named: imageName + "_normal")
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        childController.title = title
        
        let navVC = BaseNavigationViewController()
        navVC.addChildViewController(childController)
        addChildViewController(navVC)
    }
    
    
}
