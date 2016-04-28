//
//  TmallHomeCollectionViewCell.swift
//  RRArt-Swift
//
//  Created by 王天骥 on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit
import SDWebImage

let tMallId = "tMallHomeViewCell"

class TmallHomeCollectionViewCell: UICollectionViewCell {
    var tmallItem = TMallModels?(){
        didSet{
            headIcon.sd_setImageWithURL(NSURL(string:tmallItem!.Image ?? ""))
            
            
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 4
        backgroundColor = UIColor.lightGrayColor()
        headIcon.layer.cornerRadius = 4
        headIcon.layer.masksToBounds = true
        headIcon.contentMode = UIViewContentMode.ScaleAspectFill
       
    }

    @IBOutlet weak var headIcon: UIImageView!
}
