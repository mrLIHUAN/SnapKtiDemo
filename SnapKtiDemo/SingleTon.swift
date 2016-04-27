//
//  SingleTon.swift
//  SnapKtiDemo
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

//单例


class SingleTon {
    
    class var sharedInstance:SingleTon{
        struct Static {
            static let instance:SingleTon = SingleTon()
        }
    
        return Static.instance
    
    }
    
}
