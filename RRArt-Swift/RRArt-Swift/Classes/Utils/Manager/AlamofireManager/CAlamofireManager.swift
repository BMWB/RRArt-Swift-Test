//
//  CAlamofireManager.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import SVProgressHUD

let kShopProductsClassinfoUrl =  "http://app.renrenmeishu.com:20100/v1/products/classinfo"

private let instance = CAlamofireManager()

class CAlamofireManager: NSObject {
    
    class var shareTools:CAlamofireManager{
        
        return instance
        
    }
    
    /**
     商城首页数据
     */
    func tMallHomeDataRequest(param:[String:AnyObject]?,complectionHandler: HTTPRequestHandler?) -> Void {
        SVProgressHUD.showWithStatus("正在加载...")
        var params = ["limit":20,"sortby":"Sortid","order":"desc"]
        if param != nil{
            for (key,value) in param! {
                params[key] = (value as! NSObject)
            }
        }
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString: kShopProductsClassinfoUrl, parameter: params, complectionHandler: { (responseObject) in
            
            SVProgressHUD.showSuccessWithStatus("加载成功")
            complectionHandler!(responseObject: responseObject!["ClassInfo"])
            
        }) { (error) in
            SVProgressHUD.showErrorWithStatus("加载失败")
            print(error)
            
            
        }
        
    }
    
}
