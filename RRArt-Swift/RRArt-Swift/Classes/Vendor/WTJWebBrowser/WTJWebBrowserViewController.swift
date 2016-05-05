//
//  WTJWebBrowserViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/28.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import WebKit

@objc protocol WTJWebBrowserDelegate : NSObjectProtocol{
    
    optional func webBrowserdidStartLoadingURL(webBrowser:UIViewController, Url:NSURL)
    optional func webBrowserdidFinishLoadingURL(webBrowser:UIViewController, Url:NSURL)
    optional func webBrowserdidFailToLoadURL(webBrowser:UIViewController, Url:NSURL)
    
}


class WTJWebBrowserViewController: BaseViewController {
    
    var wkWebView :WKWebView?
    weak internal var wtjWebdelegate :WTJWebBrowserDelegate?
    
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
    
    
    //配置信息，主要是做cookie的配置
    class func webBrowserWithConfiguration( configuration:WKWebViewConfiguration) -> WTJWebBrowserViewController{
        return WTJWebBrowserViewController(configuration: configuration)
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
    
    func externalAppRequiredToOpenURL(url:NSURL) -> (Bool) {
        let validSchemes = ["http","https"]
        return validSchemes.contains(url.scheme)
    }
    
    func launchExternalAppWithURL(url:NSURL) -> () {
        
    }
}


extension WTJWebBrowserViewController:WKUIDelegate,WKNavigationDelegate{
    //MARK: -WKNavigationDelegate
    //开始加载
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
       
        wtjWebdelegate?.webBrowserdidStartLoadingURL!(self, Url: webView.URL!)
    }
    
    //加载完成
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        wtjWebdelegate?.webBrowserdidFinishLoadingURL!(self, Url: webView.URL!)
    }
    
    //加载失败
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        wtjWebdelegate?.webBrowserdidFailToLoadURL!(self, Url: webView.URL!)
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        
    }
    
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        
        let url = navigationAction.request.URL
        
        if externalAppRequiredToOpenURL(url!){
            
            if (navigationAction.targetFrame == nil) {
                
                loadURL(url!)
                decisionHandler(WKNavigationActionPolicy.Cancel)
                return
            }
            
        }else if UIApplication.sharedApplication().canOpenURL(url!) {
            
            launchExternalAppWithURL(url!)
            decisionHandler(WKNavigationActionPolicy.Cancel)
            return
        }
        
        decisionHandler(WKNavigationActionPolicy.Allow)
    }
    
    // js 里面的alert实现，如果不实现，网页的alert函数无效
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        
        let customalert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        customalert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (alert) in
            completionHandler(true)
        }))
        
        customalert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: { (alert) in
            completionHandler(false)
        }))
        
        presentViewController(customalert, animated: true) {
            
        }
    }
    
    // js 里面的alert实现，如果不实现，网页的alert函数无效
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let customalert = UIAlertController(title: nil, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        customalert.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: { (alert) in
            completionHandler()
        }))
        
        presentViewController(customalert, animated: true) {
            
        }
        
    }
    
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        completionHandler("Client Not handler")
    }
    
    //MARK: -WKUIDelegate
    func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        
        if (navigationAction.targetFrame != nil) {
            webView .loadRequest(navigationAction.request)
        }
        return nil
    }
    
}
