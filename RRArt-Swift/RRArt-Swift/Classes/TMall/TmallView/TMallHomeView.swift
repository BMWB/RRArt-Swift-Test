//
//  TMallHomeView.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
let tMallId = "tMallHomeViewCell"

class TMallHomeView: BaseCollectionView{
    var tmallHomeArray:[TMallModels]?{//数组保存
        didSet{
            //刷新表格
            reloadData()
        }
    }

    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        delegate = self;
        dataSource = self;
        
        registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: tMallId)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}

extension TMallHomeView:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tmallHomeArray?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(tMallId, forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.blueColor()
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("被点击")
    }

}