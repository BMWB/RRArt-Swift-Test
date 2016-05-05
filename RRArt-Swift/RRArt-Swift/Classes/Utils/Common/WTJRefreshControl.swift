//
//  WTJRefreshControl.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/3.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class WTJRefreshControl: UIRefreshControl {
    
    override init() {
        super.init()
        
        setupUI()
    }
    
    private func setupUI(){
//        addSubview(nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class WTJRefreshView: UIView {
    class func refreshView() -> WTJRefreshView {
        return NSBundle.mainBundle().loadNibNamed("WTJRefreshView", owner: nil, options: nil).last as! WTJRefreshView
    }
}