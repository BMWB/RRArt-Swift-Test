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
        //获取json文件的路径
        let path = NSBundle.mainBundle().pathForResource("MainVcSetting.json", ofType: nil)
        if let jsonPath = path{
            
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do {
                
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                
                //遍历数组创建控制器
                for dict in dictArr as! [[String:String]] {
                    
                    //报错的原因是因为参数必须有值，但是字典的返回值是可选类型
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
                
            }catch{
                
                addChildViewController("Comment_RootViewController", title: "点评", imageName: "tab_ques")
                addChildViewController("Lesson_RootViewController", title: "精选", imageName: "xiadaohang_icon_kecheng")
                addChildViewController("WebSchool_RootViewController", title: "网校", imageName: "xiadaohang_icon_wangxiao")
                addChildViewController("TMallMenu_RootViewController", title: "商城", imageName: "xiadaohang_icon_shangcheng")
                addChildViewController("MyZone_RootViewController", title: "我的", imageName: "tab_me")
                
            }
            
        }

    }
    
    /**
     动态获取命名空间创建类
     */
    private func addChildViewController(childController: String,title:String,imageName:String) {
//        <RRArt_Swift.Comment_RootViewController: 0x7fb4b36241d0>
        
        //动态获取的bundle（RRArt－Swift） 和命名空间（RRArt_Swift）有出入
//        let nameZone = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        //将字符串转为类
        let ns = "RRArt_Swift" + "." + childController
    
        let cls:AnyClass? = NSClassFromString(ns)
        
        //将anyclas说转换为制定的类型
        let vcCls = cls as! UIViewController.Type
        
        //通过class创建对象
        let vc = vcCls.init()
        
        vc.tabBarItem.image = UIImage(named: imageName + "_normal")
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")
        vc.title = title
        
        let navVC = BaseNavigationViewController()
        navVC.addChildViewController(vc)
        addChildViewController(navVC)
    }
    
    
}
