//
//  TMall_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class TMallHomeViewController: BaseViewController {
    var tmallModel = CTmallHomeModel?()
    
    var tmallArray:[TMallModels]?{//数组保存
        didSet{
            //刷新表格
            tmallHomeView.tmallHomeArray = tmallArray
            
        }
    }
    
    init(shopType type:CTmallHomeModel){
        super.init(nibName: nil, bundle: nil)
        tmallModel = type
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tmallHomeView)
        
        //获取商城首页数据
        loadData()
        
        //跳转
        tmallHomeView.clickTmallHomeItem {[unowned self](tmall) in
            debugPrint(tmall)
            let webVc = WebViewController(url: (tmall?.Url)!)
           
            self.navigationController!.pushViewController(webVc, animated: true)
        }
    }
    
    //MARK: －获取商城首页数据
    private func loadData(){
        
        CAlamofireManager.shareTools.tMallHomeDataRequest(nil,tmallModel: tmallModel!) { (responseObject) in
            
            //字典转模型
            let models = TMallModels.objectArrayWithKeyValuesArray(responseObject as! [[String:AnyObject]])
            self.tmallArray = models
            debugPrint(models)
            
        }
        
    }
    
    //MARK: －懒加载
    lazy var tmallHomeView:TMallHomeView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake((self.view.bounds.size.width-15)/2, (self.view.bounds.size.width-15)/2*1.2)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        var tmallHome = TMallHomeView(frame: CGRectMake(0, 0, self.view.bounds.size.width,UIScreen.mainScreen().bounds.size.height-64-40-35), collectionViewLayout: layout)
        
        return tmallHome
    }()
}


