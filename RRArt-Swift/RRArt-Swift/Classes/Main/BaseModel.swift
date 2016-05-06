//
//  BaseModel.swift
//  RRArt-Swift
//
//  Created by wtj on 16/5/6.
//  Copyright © 2016年 com.yibei.renrenmeishu. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
   
    override init() {
        
    }

    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    //属性没有一一对应，就会进这个方法，然后程序也不会挂掉
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    

}
