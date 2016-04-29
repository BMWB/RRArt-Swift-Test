//
//  AppDelegate.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

//切换控制器通知
let WTJSwitchRootViewcontrollerKey = "WTJSwitchRootViewcontrollerKey"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var topWindow: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //设置导航条和工具条的外观
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        //设置状态栏控制器
        topWindow = UIWindow(frame: application.statusBarFrame)
        topWindow?.hidden = false
        topWindow?.windowLevel = UIWindowLevelAlert
        topWindow?.rootViewController = TopWindowViewController.singleInstance
        
        //设置当前主控制器
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = NewfeatureCollectionViewController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        
    }
    
    func applicationWillTerminate(application: UIApplication) {
        
    }
    
    
    /**
     用于获取界面
     */
    
    private func isNewupDate() -> Bool{
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
    
    private func defaultContoller() -> UIViewController{
        
        return MainViewController()
    }
    
    
    func switchRootViewcontroller() -> Void {
        window?.rootViewController = MainViewController()
    }
    
}

