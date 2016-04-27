//
//  ButtonExtension.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

extension UIButton{
    
    /**
     设置图片和标题垂直放置 标题在下
     必须设定：标题
     图片 非背景图，图片必须以UIImage(named: )方式设定 否则将找不到
     图片大小与真实比例相同，非压缩 若图片太大则不可以
     
     - parameter imgTextDistance: 图片和文字的间距
     */

    
    func setVerticalLabelBottom(imgTextDistance:CGFloat){
        
        let imgWidth = self.imageView?.image?.size.width
        let imgHeight = self.imageView?.image?.size.height
        
        let textSize = NSString(string: (self.titleLabel?.text)!).sizeWithAttributes([NSFontAttributeName : (self.titleLabel?.font)!])
        
        let textHeight = textSize.height
        
        var interval : CGFloat!

        var titleOffsetX : CGFloat!
        var titleOffsetY : CGFloat!
        
//        self.imageView?.layer.cornerRadius = 5
//        self.imageView?.layer.masksToBounds = true
//        self.imageView?.backgroundColor = UIColor.blueColor()
        
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