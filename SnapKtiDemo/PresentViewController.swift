//
//  PresentViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(frame: CGRectMake(0, 0, 50, 30))
        btn.setTitle("返回", forState: UIControlState.Normal)
        btn.addTarget(self, action: "goBack", forControlEvents: UIControlEvents.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        bezierDrawCircle()
        
        bezierDrawCurves()
//        self.navigationController?.navigationBar.tintColor = UIColor.redColor()
//        self.navigationController?.navigationBar.translucent = false
        // Do any additional setup after loading the view.
    }
    
    
    func bezierDrawCircle(){
        let radius : CGFloat = 70.0
        let startAngle : CGFloat = 0.0
        let endAngle : CGFloat = CGFloat(M_PI * 2)
        
        
        
        let path = UIBezierPath(arcCenter: CGPointMake(180, 200), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let layer = CAShapeLayer()
        
        layer.path = path.CGPath
        
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        
        self.view.layer.addSublayer(layer)
        
        
        
    
    }
    
    
    func bezierDrawCurves(){
        let startPoint = CGPointMake(80, 300)
        let endPoint = CGPointMake(300, 300)
        let controlPoint = CGPointMake(150, 200)
        let controlPoint2 = CGPointMake(220, 400)
        
        let layer1 = CALayer()
        layer1.frame = CGRectMake(startPoint.x, startPoint.y, 10, 10)
        layer1.backgroundColor = UIColor.redColor().CGColor
        
        let layer2 = CALayer()
        layer2.frame = CGRectMake(endPoint.x, endPoint.y, 10, 10)
        layer2.backgroundColor = UIColor.redColor().CGColor
        
        let layer3 = CALayer()
        layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 10, 10)
        layer3.backgroundColor = UIColor.redColor().CGColor
        
        let path = UIBezierPath()
        let layer = CAShapeLayer()
        
        path.moveToPoint(startPoint)
        
        path.addCurveToPoint(endPoint, controlPoint1: controlPoint, controlPoint2: controlPoint2)
        
        layer.path = path.CGPath
        layer.fillColor = UIColor.clearColor().CGColor
        layer.strokeColor = UIColor.blueColor().CGColor
        
        self.view.layer.addSublayer(layer)
        self.view.layer.addSublayer(layer1)
        self.view.layer.addSublayer(layer2)
        self.view.layer.addSublayer(layer3)
        
        
        
    }
    
    
    
    func goBack(){
        self.navigationController?.popViewControllerAnimated(true)
        
        
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
