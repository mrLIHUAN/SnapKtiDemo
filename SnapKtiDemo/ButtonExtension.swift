//
//  ButtonExtension.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

extension UIButton{
    
    func setVerticalLabelBottom(imgTextDistance:CGFloat){
        
        let imgWidth = self.imageView?.image?.size.width
        let imgHeight = self.imageView?.image?.size.height
        
        let textSize = NSString(string: (self.titleLabel?.text)!).sizeWithAttributes([NSFontAttributeName : (self.titleLabel?.font)!])
        
        let textHeight = textSize.height
        
        var interval : CGFloat!

        var titleOffsetX : CGFloat!
        var titleOffsetY : CGFloat!
        
        self.imageView?.snp_makeConstraints(closure: { (make) -> Void in
            
            make.centerY.equalTo(self.snp_centerY).offset(-(textHeight+imgTextDistance)/2)
            make.centerX.equalTo(self.snp_centerX)
            make.width.equalTo(imgWidth!)
            make.height.equalTo(imgHeight!)
            
        })
        
        interval = CGFloat(imgHeight!) + CGFloat(imgTextDistance)
        titleOffsetX = CGFloat(-imgWidth!)
        titleOffsetY = interval
        
        self.titleEdgeInsets = UIEdgeInsetsMake(titleOffsetY, titleOffsetX, 0, 0)
    
    }
    
    
}