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
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.switchRootViewcontroller), name: WTJSwitchRootViewcontrollerKey, object: nil)
        
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
        window?.rootViewController = defaultContoller()
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
     获取默认界面
     */
    private func defaultContoller() -> UIViewController{
        
       return  CommonTool.isNewUpDate() ? NewfeatureCollectionViewController() : MainViewController()

    }
    
    
    func switchRootViewcontroller() -> Void {
        window?.rootViewController = MainViewController()
    }
    
    deinit{
    
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

