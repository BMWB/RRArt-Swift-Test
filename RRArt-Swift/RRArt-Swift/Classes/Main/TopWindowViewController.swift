//
//  TopWindowViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

private let instance = TopWindowViewController()

class TopWindowViewController: BaseViewController {
    private  var statusBarHidden:Bool?{
        didSet{
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    private var statusBarStyle:UIStatusBarStyle?{
        didSet{
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    class var singleInstance :TopWindowViewController{
        return instance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:对外公开方法
    
    ///隐藏状态栏
    func wtjHideStatusBar(){
        statusBarHidden = true
    }
    
    ///显示状态栏
    func wtjShowStatusBar(){
        statusBarHidden = false
    }
    
    ///黑色字体状态栏
    func wtjBlackStatusBar(){
        statusBarStyle = UIStatusBarStyle.Default
    }
    
    ///白色字体状态栏
    func wtjWhiteStatusBar(){
        statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    //MARK:stausMeths
    
    override func prefersStatusBarHidden() -> Bool {
        
        if (statusBarHidden != nil) {
            return statusBarHidden!
        }else{
            return false
        }
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        
        if (statusBarStyle != nil) {
            return statusBarStyle!
        }else{
            return UIStatusBarStyle.Default
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("点击到状态栏")
    }
    
    
    
}
