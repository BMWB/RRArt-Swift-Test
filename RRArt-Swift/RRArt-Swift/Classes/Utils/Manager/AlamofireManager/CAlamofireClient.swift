//
//  CAlamofireClient.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/26.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import Alamofire

public enum HTTPRequestError: ErrorType {
    case None
    case SystemError(error: NSError?)
    case NetworkError
    case BusinessError(description: String)
}

public typealias HTTPRequestHandler = (responseObject: AnyObject?) -> Void
public typealias HTTPReErrorHandler = (error: HTTPRequestError?) -> Void
//public typealias HTTPRequestJSONHandler = (responseObject: JSON?, error: HTTPRequestError?) -> Void

private let instance = CAlamofireClient()

public class CAlamofireClient:NSObject{
    
    class var shareClient:CAlamofireClient{
        
        return instance
        
    }
    
    public enum Method : String {
        case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
        var alamofireMethod: Alamofire.Method {
            var results = Alamofire.Method.GET
            switch self {
            case .GET:
                results = Alamofire.Method.GET
            case .POST:
                results = Alamofire.Method.POST
            case .HEAD:
                results = Alamofire.Method.HEAD
            case .OPTIONS:
                results = Alamofire.Method.OPTIONS
            case .PUT:
                results = Alamofire.Method.PUT
            case .PATCH:
                results = Alamofire.Method.POST
            case .DELETE:
                results = Alamofire.Method.DELETE
            case .TRACE:
                results = Alamofire.Method.TRACE
            case .CONNECT:
                results = Alamofire.Method.CONNECT
            }
            return results
        }
    }
    
    
    public func dataRequest(method m: Method, urlString url: URLStringConvertible, parameter param: [String : AnyObject]?, complectionHandler: HTTPRequestHandler?,errorHandler:HTTPReErrorHandler?) -> Request{
        
        let req = Alamofire.request(m.alamofireMethod, url, parameters: param, encoding: .URL, headers: nil)
        
        req.responseJSON { (resp) -> Void in
            if resp.result.isSuccess {
                var dict = resp.result.value as! [String :AnyObject]
                
                if (dict["code"] as! Int) == 200{
                    if let handler = complectionHandler {
                        handler(responseObject: resp.result.value)
                    }
                    
                }else{
                    if let handler = errorHandler {
                        
                        handler(error: HTTPRequestError.BusinessError(description: (dict["code"] as! String)))
                    }
                    
                }
                
            } else {
                
                if let handler = errorHandler {
                    handler(error: HTTPRequestError.SystemError(error: resp.result.error))
                }
            }
        }
        
        return req
    }
    
    
}
