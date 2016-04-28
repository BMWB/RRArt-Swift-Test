//
//  CAlamofireManager.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import SVProgressHUD


private let instance = CAlamofireManager()

class CAlamofireManager: NSObject {
    
    class var shareTools:CAlamofireManager{
        
        return instance
        
    }
    
    /**
     商城首页数据
     */
    func tMallHomeDataRequest(param:[String:AnyObject]?,tmallModel:CTmallHomeModel,complectionHandler: HTTPRequestHandler?) -> Void {
        SVProgressHUD.showWithStatus("正在加载...")
        var params = ["limit":20,"sortby":"Sortid","order":"desc"]
        if param != nil{
            for (key,value) in param! {
                params[key] = (value as! NSObject)
            }
        }
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString: getHttpRequestUrl(tmallModel.Url!), parameter: params, complectionHandler: { (responseObject) in
            
            SVProgressHUD.showSuccessWithStatus("加载成功")
            SVProgressHUD.dismissWithDelay(0.5)
            complectionHandler!(responseObject: responseObject![(tmallModel.key! ) ])
            
        }) { (error) in
            SVProgressHUD.showErrorWithStatus("加载失败")
            print(error)
            
        }
        
    }
    
    //MARK:获取http请求路径
    
    ///获取http请求路径
    private func getHttpRequestUrl(url:String) -> String{
    
    return kBaseUrl + ":" + kPort20100 + url
        
    }
    
}
