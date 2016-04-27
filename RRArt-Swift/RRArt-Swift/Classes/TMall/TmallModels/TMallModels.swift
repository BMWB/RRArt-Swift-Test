//
//  TMallModels.swift
//  RRArt-Swift
//
//  Created by wtj on 16/4/27.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class TMallModels: NSObject{
    ///激活
    var Active :Int = 0
    
    ///买的次数
    var BuyTimes :Int = 0
    
    ///商品描述
    var Decript :String?
    
    ///网校的课时
    var Hours :Int = 0
    
    ///
    var Id :Int = 0
    
    ///商品详细介绍Url
    var Url :String?
    
    ///商品名字
    var Name :String?
    
    ///主标题
    var Maintitle :String?
    
    ///主标题
    var Subtitle :String?
    
    ///正常美钻
    var NormalMoney :Int = 0
    
    ///当前价格美钻
    var SaleMoney :Int = 0
    
    ///商品库存
    var Stock :Int = 0
    
    ///商品总数
    var Total :Int = 0
    
    ///排序
    var Sortid :Int = 0
    
    ///商品图片
    var Image :String?
    
    ///主标题
    var Title :String?
    
    ///标签分类
    var Tags :Int = 0
    
    ///商品url
    var RealUrl :String?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    //属性没有一一对应，就会进这个方法，然后程序也不会挂掉
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    //打印当前模型
    var properties = ["Active","BuyTimes","Decript","Hours","Id","Url","Name","Maintitle","Subtitle","NormalMoney","SaleMoney","Stock","Total","Sortid","Image","Title","Tags","RealUrl"]
    override var description: String{
        let dict = dictionaryWithValuesForKeys(properties)
        return "\(dict)"
    }
    
}
