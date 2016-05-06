//
//  MyZone_leftCell.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/6.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class MyZone_leftCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var org : COrgListModels?{
        didSet{
        
            titleLabel.text = org?.Name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.darkGrayColor()
        backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        let selectView = UIView()
        selectView.backgroundColor = UIColor.blackColor()
        selectedBackgroundView = selectView
        titleLabel.highlightedTextColor = UIColor.whiteColor()

    }

    

}
