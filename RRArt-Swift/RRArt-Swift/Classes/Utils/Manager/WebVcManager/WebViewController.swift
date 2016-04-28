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
         print(Url.absoluteString)
    }
    
    func webBrowserdidFailToLoadURL(webBrowser: UIViewController, Url: NSURL) {
        
    }
}