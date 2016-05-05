//
//  BaseViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    deinit {
        print("\(self.classForCoder)控制器释放了")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ///酷炫的装载动画
    lazy var activityIndicatorView : NVActivityIndicatorView = {
        var  activity = NVActivityIndicatorView(frame: CGRectMake(self.view.center.x, self.view.center.y, 50, 50), type: .BallClipRotatePulse , color: UIColor.orangeColor(), padding: 5)
        activity.center = self.view.center
        
        UIApplication.sharedApplication().keyWindow?.addSubview(activity)
        return activity
        
    }()
}
