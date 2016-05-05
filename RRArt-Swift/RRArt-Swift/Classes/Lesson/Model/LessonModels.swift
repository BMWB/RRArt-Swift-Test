//
//  LessonModels.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/5.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class LessonModels: NSObject {
    ///
    var Id :Int = 0
    
    ///封面
    var Cover : String?
    
    ///介绍
    var Description : String?
    
    ///画室id
    var Orgid :Int = 0
    
    ///预览url
    var Preview : String?
    
    ///美钻
    var Price :Int = 0
    
    ///是否公开(免费)
    var Sortid :Int = 0
    
    ///标题
    var Title : String?
    
    ///频道类别,1、视频，2、文章，3、图片，4、画室
    var Type :Int = 0
    
    ///vip等级
    var Viplevel :Int = 0
    
    ///观看数
    var View :Int = 0
    
}

class COrgListModels: NSObject {
    ///
    var Id :Int = 0
    
    ///封面
    var Cover : String?
    
    ///介绍
    var Description : String?
    
    var Code : String?
    
    var Name : String?
    
    var Sortid :Int = 0
    
    var View :Int = 0
    
    ///标题
    var Title : String?

    
}
