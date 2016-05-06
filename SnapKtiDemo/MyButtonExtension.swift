//
//  MyButtonExtension.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

/// 默认时间间隔
var defaultIntervalL:Double =  0.5

/// 延时时间key
private var  buttonDelayedTime = "buttonDelayedTime"
/// 是否可以点击key
private var  buttonIsIgnoreEvent = "buttonIsIgnoreEvent"

extension UIButton{
    
    /// 延时时间
    public var timeInterval:NSTimeInterval {
        get{
            if(objc_getAssociatedObject(self, &buttonDelayedTime) == nil){
                objc_setAssociatedObject(self, &buttonDelayedTime, 0,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return 0
            }else{
                
                return objc_getAssociatedObject(self,&buttonDelayedTime).doubleValue
            }
        }
        set{
            
            objc_setAssociatedObject(self, &buttonDelayedTime, newValue,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 是否可以点击 禁止调用
    private var isIgnoreEvent:Bool {
        get{
            if(objc_getAssociatedObject(self, &buttonIsIgnoreEvent) == nil){
                objc_setAssociatedObject(self, &buttonIsIgnoreEvent, true,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return false
            }else{
                
                return objc_getAssociatedObject(self, &buttonIsIgnoreEvent).boolValue
            }
        }
        
        set{
            objc_setAssociatedObject(self, &buttonIsIgnoreEvent, newValue,.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public override class func initialize(){
        struct Static{
            static var token:dispatch_once_t = 0
        }
        if self != UIButton.self{
            return
        }
        dispatch_once(&Static.token, {
            _ in
            
            let selA = Selector("sendAction:to:forEvent:")
            let selB = Selector("mySendAction:target:event:")
            let methodA = class_getInstanceMethod(self,selA);
            let methodB = class_getInstanceMethod(self,selB);
            let isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
            if (isAdd) {
                class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
                
            }else{
                
                method_exchangeImplementations(methodA, methodB);
            }
            
        })
    }
    
    
    public func mySendAction(action:Selector,target:NSObject,event:UIEvent){
        if(NSStringFromClass(self.classForCoder) == "UIButton"){
            if (self.isIgnoreEvent){
                
                return
            }else{
                self.isIgnoreEvent = true
            }
            self.mySendAction(action, target: target, event: event)
            if (self.timeInterval == 0)
            {
                self.delay(defaultIntervalL) { () -> () in
                    self.isIgnoreEvent = false
                }
            }else{
                self.delay(timeInterval) { () -> () in
                    self.isIgnoreEvent = false
                }
            }
            
        }
    }
    
}

public extension NSObject {
    
    /**
     在延迟后结束. 在 main_queue 调用.
     
     - parameter delay: 延迟的秒数
     */
    func delay(delay: Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
}
