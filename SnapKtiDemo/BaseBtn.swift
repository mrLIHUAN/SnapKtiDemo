//
//  BaseBtn.swift
//  SnapKtiDemo
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
var dic:[String : ()->()] = [ : ]

extension UIButton{
    
    func tapBtn(click:()->()){
        
        baoCun(click)
        creatClick()
    }
    
    func baoCun(block:()->()){
        
        print("\(String(self.hashValue))")
        dic[String(self.hashValue)] = block
    }
    
    
    func creatClick(){
        self.addTarget(self, action: "ggg", forControlEvents: UIControlEvents.TouchUpInside)
    }
    func ggg(){
        dic[String(self.hashValue)]!()
    }
}


class BaseBtn: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
