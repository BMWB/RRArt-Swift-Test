//
//  CAlamofireManager.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class CAlamofireManager: NSObject {
    /**
     商城首页数据
     */
    func tMAllHomeDataRequest(urlString:String ,param:[String:AnyObject]?,complectionHandler: HTTPRequestHandler?) -> Void {
        
        CAlamofireClient().dataRequest(method: .GET, urlString: urlString, parameter: param) { (responseObject, error) in
            
            complectionHandler!(responseObject: responseObject,error: error)
            
        }
    }
    
}
