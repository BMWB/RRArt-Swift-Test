//
//  LessonHomeTableViewCell.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/5.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class LessonHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var titleImage: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    var lessonHome = LessonModels?(){
    
        didSet{
        
            headImage.sd_setImageWithURL(NSURL(string: (lessonHome?.Cover)!), placeholderImage: UIImage(named: ""))
            title.text = lessonHome?.Title
            subTitle.text = lessonHome?.Description
            
            switch  lessonHome!.Type{
            case 1:
                titleImage.image = UIImage(named: "kecheng_icon_shipin")
                
            case 2:
                titleImage.image = UIImage(named: "kecheng_icon_wenzhang")
                
            case 3:
                titleImage.image = UIImage(named: "kecheng_icon_tuku")
                
            default: break
               
                
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.numberOfLines = 0
    
    }


}
