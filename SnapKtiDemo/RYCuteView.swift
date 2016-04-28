//
//  RYCuteView.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/27.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

let SYS_DEVICE_WIDTH = UIScreen.mainScreen().bounds.size.width //屏幕宽度
let SYS_DEVICE_HEIGHT = UIScreen.mainScreen().bounds.size.height //屏幕高度

let MIN_HEIGHT : CGFloat = 200 //图形最小的高度



class RYCuteView: UIView {
    
   
//    
  dynamic var curveX : CGFloat = 0 //小红点的X坐标
  dynamic var curveY : CGFloat = 0 //小红点的Y坐标
    
    var curveView : UIView! //小红点
    var shapeLayer : CAShapeLayer!//
    var disPlayLink : CADisplayLink!
    var mHeight : CGFloat!
    var isAnimating : Bool!
    
//    
//    let kX : NSString = "curveX"
//    let kY : NSString = "curveY"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //监听小红点的X坐标和Y坐标
        self.addObserver(self, forKeyPath: "curveX", options: NSKeyValueObservingOptions.New, context: nil)
        self.addObserver(self, forKeyPath: "curveY" as String, options: NSKeyValueObservingOptions.New, context: nil)
        
        //
        configShapeLayer()
        //创建小红点
        configCurveView()
        //添加pan
        configAction()
        
    }
    
    deinit{
        self.removeObserver(self, forKeyPath: "curveX")
        self.removeObserver(self, forKeyPath: "curveY")
    
    }
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        let key = keyPath! as NSString
        
        if key .isEqualToString("curveX") || key .isEqualToString("curveY") {
        
            //通过监听到的X、Y 的变化进行更新形状变化
        self.updateShapeLayerPath()
        
        }
        
    }
    
    
    /**configAction*/
    func configAction(){
        mHeight = 100
        isAnimating = false
        //手势
        let pan = UIPanGestureRecognizer(target: self, action: "handlePanAction:")
        self.userInteractionEnabled = true
        self.addGestureRecognizer(pan)
        
        //CADisplayLink默认每秒60次calculatePath是算出在运行期间cureView的坐标，从而确定shapeLayer的形状
        disPlayLink = CADisplayLink(target: self, selector: "calculatePath")
        disPlayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSDefaultRunLoopMode)
        disPlayLink.paused = true
        
        
        
    }
    
    
    func handlePanAction(pan : UIPanGestureRecognizer){
    
        if !isAnimating{
            
            if pan.state == UIGestureRecognizerState.Changed {
                
                let point = pan .translationInView(self)
                mHeight = point.y * 0.7 + MIN_HEIGHT
                curveX = SYS_DEVICE_WIDTH / 2.0 + point.x
                
                print("\(point.y)")
                
                curveY = mHeight > MIN_HEIGHT ? mHeight : MIN_HEIGHT
                
                curveView.frame = CGRectMake(curveX , curveY, curveView.frame.size.width, curveView.frame.size.height)
            
            }else if pan.state == .Changed || pan.state == .Ended || pan.state == .Failed {
                
                isAnimating = true
                disPlayLink.paused = false
                
                UIView .animateWithDuration(1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { [weak self]() -> Void in
                    
                    //小红点是一个View,所以在闭包中有弹簧的效果，然后根据他的动效路径，在calculatePath中计算弹性图形的形状
                    
                    self!.curveView.frame = CGRectMake(SYS_DEVICE_WIDTH/2.0, MIN_HEIGHT, 3, 3)
                    
                    }, completion: { [weak self](finished : Bool) -> Void in
                        if finished {
                            self!.disPlayLink.paused = true
                            self!.isAnimating = false
                        }
                })
            
            }
            
        }
        
    }
    
    func calculatePath(){
        
        // 由于手势结束时,r5执行了一个UIView的弹簧动画,把这个过程的坐标记录下来,并相应的画出_shapeLayer形状
        let layer = curveView.layer.presentationLayer()
        curveX = (layer?.position.x)!
        curveY = (layer?.position.y)!
    
    }
    /**configShapeLayer*/
    
    func configShapeLayer(){
        
        
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.blueColor().CGColor
        self.layer.addSublayer(shapeLayer)
    
    }
    
    func configCurveView(){
        curveX = SYS_DEVICE_WIDTH / 2.0
        curveY = MIN_HEIGHT
        
        curveView = UIView(frame: CGRectMake( curveX , curveY, 3, 3))
        curveView.backgroundColor = UIColor.redColor()
        self.addSubview(curveView)
    
    }
    
    func updateShapeLayerPath(){
        
        let tpath = UIBezierPath()
        tpath .moveToPoint(CGPointMake(0, 0))
        tpath .addLineToPoint(CGPointMake(SYS_DEVICE_WIDTH, 0))
        tpath.addLineToPoint(CGPointMake(SYS_DEVICE_WIDTH, MIN_HEIGHT))
        tpath.addQuadCurveToPoint(CGPointMake(0, MIN_HEIGHT), controlPoint: CGPointMake(curveX, curveY))
        tpath .closePath()
        shapeLayer.path = tpath.CGPath
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    
    
}
