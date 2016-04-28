//
//  WTJWebBrowserViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/28.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import WebKit

class WTJWebBrowserViewController: UIViewController {
    
    var wkWebView :WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if wkWebView != nil{
            wkWebView?.frame = view.bounds
            wkWebView?.autoresizingMask = [UIViewAutoresizing.FlexibleWidth,UIViewAutoresizing.FlexibleHeight]
            wkWebView?.UIDelegate = self
            wkWebView?.navigationDelegate = self
            wkWebView?.multipleTouchEnabled = true
            wkWebView?.scrollView.alwaysBounceVertical = true
            view.addSubview(wkWebView!)
        }
        
    }
    
    //MARK: -构造方法
    
    init(){
        super.init(nibName: nil, bundle: nil)
        
        wkWebView = WKWebView()
    }
    
    init(configuration:WKWebViewConfiguration) {
        super.init(nibName: nil, bundle: nil)
        wkWebView = WKWebView(frame: CGRectZero, configuration: configuration)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func loadURLString(urlString:String) -> () {
        let URl = NSURL(string:urlString)
        loadURL(URl!)
    }
    
    func loadURL(url:NSURL) -> () {
        //添加cookies
        let properties = [NSHTTPCookieName:"token",
                          NSHTTPCookieDomain:"",
                          NSHTTPCookieExpires:NSDate(timeIntervalSinceNow: 60*60),
                          NSHTTPCookiePath:kBaseUrl,
                          NSHTTPCookieValue:"1111111"]
        
        let cookie = NSHTTPCookie(properties: properties)!
        let headers = NSHTTPCookie.requestHeaderFieldsWithCookies([cookie])
        let mutableRequest = NSMutableURLRequest(URL: url)
        mutableRequest.setValue(headers["Cookie"], forHTTPHeaderField: "Cookie")
        [loadRequest(mutableRequest)]
        
    }
    
    func loadRequest(request:NSURLRequest) -> (){
        
        if wkWebView != nil {
            wkWebView!.loadRequest(request)
        }
        
    }
}


extension WTJWebBrowserViewController:WKUIDelegate,WKNavigationDelegate{
    //MARK: -UIWebViewDelegate
    
    
    //MARK: -WKUIDelegate,WKNavigationDelegate
    
}