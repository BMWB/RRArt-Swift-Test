//
//  CAlamofireManager.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

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
        let params = ["limit":10,"sortby":"Sortid","order":"desc"]
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString:kShopProductsClassinfoUrl, parameter: params) { (responseObject, error) in
            
            complectionHandler!(responseObject: responseObject,error: error)
            
        }
    }
    
}
