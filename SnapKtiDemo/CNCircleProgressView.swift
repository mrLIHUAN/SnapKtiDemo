//
//  CNCircleProgressView.swift
//  SnapKtiDemo
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CNCircleProgressView: UIView {

    
    var frame1 : CGRect!
    
    var imageView : UIImageView!
    
    var outLayer : CAShapeLayer!
    
    var progressLayer : CAShapeLayer!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        frame1 = frame
        
        self.layer.cornerRadius = frame1.size.width / 2
        self.layer.masksToBounds = true
        imageView = UIImageView(frame: self.bounds)
        imageView.backgroundColor = UIColor.blackColor()
        self.addSubview(imageView)
        
        addGrayAnnulus()
        
//        addprogressLayer()
    }
    
    func addGrayAnnulus(){
        
        outLayer = CAShapeLayer()
        
        let rect = CGRectMake(3 / 3, 3 / 3 , frame1.size.width - 3, frame1.size.height - 3)
        let path = UIBezierPath(ovalInRect: rect)
        outLayer.strokeColor = UIColor.lightGrayColor().CGColor
        outLayer.lineWidth = 3
        outLayer.fillColor = UIColor.clearColor().CGColor
        outLayer.lineCap = kCALineCapRound
        outLayer.path = path.CGPath
        self.layer.addSublayer(self.outLayer)
        
        progressLayer = CAShapeLayer()
        progressLayer.fillColor = UIColor.clearColor().CGColor

        progressLayer.strokeColor = UIColor.redColor().CGColor
        progressLayer.lineWidth = 3
        progressLayer.lineCap = kCALineCapRound
        progressLayer.path = path.CGPath
        self.layer.addSublayer(progressLayer)
        
        
        self.transform = CGAffineTransformMakeRotation(-CGFloat(M_PI_2))
        imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
    
    }
    
//    func addprogressLayer(){
    
    
        
    
//    }
    
    func updateProgressWithNumber(number : CGFloat)
    {

        let a = CATransition()
        a.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        a.duration = 0.5
        progressLayer.strokeEnd = number / 100.0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
