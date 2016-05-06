//
//  CAlamofireManager.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit


private let instance = CAlamofireManager()

class CAlamofireManager: NSObject {
    
    class var shareTools:CAlamofireManager{
        
        return instance
        
    }
    
    /**
     商城首页数据
     */
    func tMallHomeDataRequest(param:[String:AnyObject]?,tmallModel:CTmallHomeModel,complectionHandler: HTTPRequestHandler?,faile:HTTPReErrorHandler?) -> Void {
        
        var params = ["limit":20,"sortby":"Sortid","order":"desc"]
        if param != nil{
            for (key,value) in param! {
                params[key] = (value as! NSObject)
            }
        }
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString: getHttpRequestUrl(tmallModel.Url!), parameter: params, complectionHandler: { (responseObject) in
            
            if let rep =  responseObject![(tmallModel.key! )] as?  [[String:AnyObject]] {
                
                complectionHandler!(responseObject:rep)
                
            }else{
                faile!(error: nil)
            }
            
        }) { (error) in
            print(error)
            faile!(error: error)
            
        }
        
    }
    
    /**
     精选首页
     */
    
    func lessonHomeDataRequest(param:[String:AnyObject]?,orglist:COrgListModels,complectionHandler: HTTPRequestHandler?,faile:HTTPReErrorHandler?) -> Void {
        var params = ["limit":20,"sortby":"Sortid","order":"desc"]
        if param != nil{
            for (key,value) in param! {
                params[key] = (value as! NSObject)
            }
        }
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString: (getHttpRequestUrl(kLessonChannelsUrl) + "?query=Orgid:" + "\(orglist.Id)"), parameter: params, complectionHandler: { (responseObject) in
            
            if let rep = responseObject!["ChannelList"] as? [[String:AnyObject]] {
                complectionHandler!(responseObject:rep)
                
            }else{
                
                faile!(error: nil)
            }
            
        }) { (error) in
            faile!(error: error)
        }
        
    }
    
    /**
     获取精选分类
     */
    
    func lessonOrgsListRequestData(handler complectionHandler: HTTPRequestHandler?) -> Void {
        
        let params = ["limit":-1,"sortby":"Sortid","order":"asc"]
        
        CAlamofireClient.shareClient.dataRequest(method: .GET, urlString: (getHttpRequestUrl(kLessonOrgsListUrl) + "?query=public:1"), parameter: params, complectionHandler: { (responseObject) in
            
            if let rep = responseObject!["List"] as?  [[String:AnyObject]] {
                complectionHandler!(responseObject: rep)
            }
            
            
        }) { (error) in
            print(error)
           
        }
    }
    
    //MARK:获取http请求路径
    
    ///获取http请求路径
    private  func getHttpRequestUrl(url:String) -> String{
        
        return kBaseUrl + ":" + kPort20100 + url
        
    }
    
}
