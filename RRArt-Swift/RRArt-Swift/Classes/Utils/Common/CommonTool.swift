//
//  CommonTool.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/29.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class CommonTool: NSObject {

    /**
     获取当前软件的版本号是否更新
     */

    class func isNewUpDate() -> Bool {
        //1、获取当前软件的版本号
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        //2、获取以前的版本号
        let sandboxVersion = NSUserDefaults.standardUserDefaults().objectForKey("CFBundleShortVersionString") as? String ?? ""
        //3、比较当前版本号和以前版本号
        
        //降序比较
        if currentVersion.compare(sandboxVersion) == NSComparisonResult.OrderedDescending {
            //3.1存储当前版本号 ios7以后就不用同步啦
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: "CFBundleShortVersionString")
            return true
        }
        
        return false

    }
}
