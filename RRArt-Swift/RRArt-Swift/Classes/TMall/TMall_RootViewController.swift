//
//  TMall_RootViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/25.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class TMall_RootViewController: BaseViewController {
    var tmallArray:[TMallModels]?{//数组保存
        didSet{
        //刷新表格
            tmallHomeView.tmallHomeArray = tmallArray
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tmallHomeView)
        
        loadData()
    }
    
    //获取商城首页数据
    private func loadData(){
        
        CAlamofireManager.shareTools.tMallHomeDataRequest(nil) { (responseObject) in
            
            //字典转模型
            let models = TMallModels.objectArrayWithKeyValuesArray(responseObject as! [[String:AnyObject]])
            self.tmallArray = models
            print(models)
        }
        
    }
    

    lazy var tmallHomeView:TMallHomeView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake((self.view.bounds.size.width-15)/2, (self.view.bounds.size.width-15)/2*1.3)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5)
        
        var tmallHome = TMallHomeView(frame: CGRectMake(0, 0, self.view.bounds.size.width,  self.view.bounds.size.height), collectionViewLayout: layout)
        
        return tmallHome
    }()
}

