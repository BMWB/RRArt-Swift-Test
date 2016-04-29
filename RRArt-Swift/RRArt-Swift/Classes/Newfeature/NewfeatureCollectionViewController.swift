//
//  NewfeatureCollectionViewController.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/29.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "NewfeatureCell"

class NewfeatureCollectionViewController: UICollectionViewController {
    private let pageCont = 3
    private var layout : UICollectionViewFlowLayout = NewfeatureLayout()
    
    init(){
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.registerClass(NewfeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension NewfeatureCollectionViewController{
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pageCont
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! NewfeatureCell
        
        cell.imageIndex = indexPath.row
        
        return cell
    }
    
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let path = collectionView.indexPathsForVisibleItems().last!
        if path.item == (pageCont-1){
            let cell = collectionView.cellForItemAtIndexPath(path) as! NewfeatureCell
            cell.startBtnAnimation()
            
        }
    }
}

class NewfeatureCell :UICollectionViewCell{
    
    private var imageIndex:Int?{
        didSet{
            
            iconView.image = UIImage(named: "newfeature\(imageIndex! + 1)")
            
            if imageIndex != 2 {
                startBtn.hidden = true
            }
        }
    }
    
    func startBtnAnimation() -> Void {
        
        startBtn.transform = CGAffineTransformMakeScale(0.0, 0.0)
        startBtn.userInteractionEnabled = false
        
        startBtn.hidden = false
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 10, options: UIViewAnimationOptions(rawValue:0), animations: {
            
            self.startBtn.transform = CGAffineTransformIdentity
            
        }) { (_) in
            
            self.startBtn.userInteractionEnabled = true
        }
    }
    
    func hiddenBtn() -> Void {
        startBtn.hidden = true
    }
    
    func startBtnClick() -> Void {
       NSNotificationCenter.defaultCenter().postNotificationName("WTJSwitchRootViewcontrollerKey", object: nil)
      
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        iconView.frame = contentView.bounds
        startBtn.frame = CGRectMake((contentView.bounds.size.width-150)/2, contentView.bounds.size.height-80, 150, 40)
        
        contentView.addSubview(iconView)
        contentView.addSubview(startBtn)
        
    }
    
    
    private lazy var iconView = UIImageView()
    private lazy var startBtn : UIButton = {
        let btn = UIButton()
        
        btn.backgroundColor = UIColor.orangeColor()
        btn.hidden = true
        btn.setTitle("进入宝典", forState: UIControlState.Normal)
        btn.addTarget(self, action:#selector(NewfeatureCell.startBtnClick) , forControlEvents:UIControlEvents.TouchUpInside )
        
        return btn
        
    }()
}

private class NewfeatureLayout : UICollectionViewFlowLayout {
    
    //准备布局
    private override func prepareLayout() {
        
        itemSize = UIScreen.mainScreen().bounds.size
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.bounces = false
        collectionView?.pagingEnabled = true
        
    }
}
