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
        
        //添加更换根控制器监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.switchRootViewcontroller), name: WTJSwitchRootViewcontrollerKey, object: nil)
        
        //设置3D Touch 的选项
        let firstItemIcon : UIApplicationShortcutIcon = UIApplicationShortcutIcon(type: .Share)
        let firstItem = UIMutableApplicationShortcutItem(type: "1", localizedTitle: "分享", localizedSubtitle: nil, icon: firstItemIcon, userInfo: nil)
        
        let twoItemIcon : UIApplicationShortcutIcon = UIApplicationShortcutIcon(type: .Compose)
        let twoItem = UIMutableApplicationShortcutItem(type: "2", localizedTitle: "编辑", localizedSubtitle: nil, icon: twoItemIcon, userInfo: nil)
        
        application.shortcutItems = [firstItem,twoItem]
        
        //设置导航条和工具条的外观
        UINavigationBar.appearance().tintColor = UIColor.orangeColor()
        UITabBar.appearance().tintColor = UIColor.orangeColor()
        
        //设置当前主控制器
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        window?.rootViewController = defaultContoller()
        window?.makeKeyAndVisible()
        
        //设置状态栏控制器
        topWindow = UIWindow(frame: application.statusBarFrame)
        topWindow?.hidden = false
        topWindow?.windowLevel = UIWindowLevelAlert
        topWindow?.rootViewController = TopWindowViewController.singleInstance

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
    
    func application(application: UIApplication, performActionForShortcutItem shortcutItem: UIApplicationShortcutItem, completionHandler: (Bool) -> Void) {
        
        completionHandler(handledShortCutItem(shortcutItem))
    }
    
    func handledShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool{
    
        let handled = false
        
        
        if shortcutItem.type == "1" {
//            let rootNavigationViewController = window!.rootViewController as? UINavigationController
            
        }
        
        if shortcutItem.type == "2" {
            
        }
        
        return handled
    
    }
    
    /**
     获取默认界面
     */
    private func defaultContoller() -> UIViewController{
        
       return  CommonTool.isNewUpDate() ? NewfeatureCollectionViewController() : MMViewController()

    }
    
    
    func switchRootViewcontroller() -> Void {
        window?.rootViewController = MMViewController()
    }
    
    deinit{
    
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

