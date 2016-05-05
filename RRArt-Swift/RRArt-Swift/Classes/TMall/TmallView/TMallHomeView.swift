//
//  TMallHomeView.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

///商城首页点击回调闭包
typealias TMallHomeClickHandler = (tmall:TMallModels?) -> Void
private let tMallId = "tMallHomeViewCell"

class TMallHomeView: BaseCollectionView{
    //在Swift 中，如果在某个类中定义一个属性，那么这个属性必须要初始化，负责会报错，
    
    var clickHandler : TMallHomeClickHandler?
    var tmallHomeArray:[TMallModels]?{//数组保存
        didSet{
            //刷新表格
            reloadData()
        }
    }
    
    //MARK: －构造方法
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        delegate = self;
        dataSource = self;
        
        registerNib(UINib(nibName: "TmallHomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: tMallId)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: －私有方法 闭包回调
    func clickTmallHomeItem(tmall: TMallHomeClickHandler) {
        
        self.clickHandler = tmall
    
    }
    
}

//MARK:UICollectionViewDelegate,UICollectionViewDataSource
extension TMallHomeView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tmallHomeArray?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(tMallId, forIndexPath: indexPath) as! TmallHomeCollectionViewCell
        
        let tamllItem = self.tmallHomeArray![indexPath.row]
        
        cell.tmallItem = tamllItem
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let tamllItem = self.tmallHomeArray![indexPath.row]
        
        if let handler  = self.clickHandler{
            
            handler(tmall: tamllItem)
            
        }
        
    }
    
}