//
//  WebViewController.swift
//  RRArt-Swift
//
//  Created by 王天骥 on 16/4/28.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class WebViewController: WTJWebBrowserViewController{
    
    var urlStr : String?
    
    init(url:String) {
        super.init()
        urlStr = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wtjWebdelegate = self
        if urlStr != nil {
            loadURLString(urlStr!)
        }
        
    }
    
}

extension WebViewController : WTJWebBrowserDelegate{
    
    func webBrowserdidStartLoadingURL(webBrowser: UIViewController, Url: NSURL) {
       
    }
    
    func webBrowserdidFinishLoadingURL(webBrowser: UIViewController, Url: NSURL) {
        let icon = "var word = document.getElementById('downloadNav');"
        let icon2 = "word.remove();"
        let icon3 = "var change = document.getElementById('channelName');"
        let icon4 = "change.innerHTML = '艺考通';"
        
        wkWebView?.evaluateJavaScript(icon, completionHandler: nil)
        wkWebView?.evaluateJavaScript(icon2, completionHandler: nil)
        wkWebView?.evaluateJavaScript(icon3, completionHandler: nil)
        wkWebView?.evaluateJavaScript(icon4, completionHandler: nil)
        
    }
    
    func webBrowserdidFailToLoadURL(webBrowser: UIViewController, Url: NSURL) {
        
    }
}