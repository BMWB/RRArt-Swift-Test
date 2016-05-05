//
//  WTJConfig.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/5.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

// MARK: - 获取SB
func GET_SB (sbName : String) -> UIStoryboard {
    return UIStoryboard(name: sbName, bundle: NSBundle.mainBundle())
}

// MARK: - 获得AppDelegate
let App_Delagate   = UIApplication.sharedApplication().delegate as! AppDelegate

// MARK: - 屏幕宽高
let kScreen_Bounds = UIScreen.mainScreen().bounds
let kScreen_Width  : CGFloat = UIScreen.mainScreen().bounds.width
let kScreen_Height : CGFloat = UIScreen.mainScreen().bounds.height

func kBlackStatusBar() {
   TopWindowViewController.singleInstance.wtjBlackStatusBar()
}

func kWhiteSTatusBar() {
    TopWindowViewController.singleInstance.wtjWhiteStatusBar()
}

func kShowStatusBar(){
    TopWindowViewController.singleInstance.wtjShowStatusBar()
}

func kHideStatusBar(){
    TopWindowViewController.singleInstance.wtjHideStatusBar()
}
