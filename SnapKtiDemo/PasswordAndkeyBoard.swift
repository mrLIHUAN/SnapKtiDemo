//
//  PasswordAndkeyBoard.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

@objc protocol PassStringDelegate{
    
    optional func PassWordString(pass: String)
    
}

class PasswordAndkeyBoard: UIView {

    var del : PassStringDelegate!
    
    var passWordView : UIView!
    var KeyBoardView : UIView!
    var backView : UIView!
    
    var SCREEN_WIDTH : CGFloat!
    var SCREEN_HEIGHT : CGFloat!
    
    var PassWordStr : NSString!
    
    var tf1 : UITextField!
    var tf2 : UITextField!
    var tf3 : UITextField!
    var tf4 : UITextField!
    var tf5 : UITextField!
    var tf6 : UITextField!
    
    var textFields = NSMutableArray()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        


        SCREEN_WIDTH = self.frame.size.width
        SCREEN_HEIGHT = self.frame.size.height
        
        self.backgroundColor = UIColor.clearColor()
        allocPassWrod()
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func allocPassWrod(){
    
    
    creatBackView()
    creatPasswordView()
    creatKeyBoardView()
        
    
    }
    
    
    func show(){
        
        
//        [UIView beginAnimations:@"animationID" context:nil];
//        [UIView setAnimationDuration:0.35f];
//        [view setFrame:rect];
//        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:view cache:YES];
//        [UIView commitAnimations];
        
        donghuaView(passWordView, rect: CGRectMake(10, (SCREEN_HEIGHT - 20) / 2, SCREEN_WIDTH - 20, 100))
        donghuaView(KeyBoardView, rect: CGRectMake(0, SCREEN_HEIGHT - 200, SCREEN_WIDTH, 200))
        
        
        
        
        UIView.beginAnimations("animationID", context: nil)
        UIView.setAnimationDuration(0.35)
        UIView .setAnimationTransition(.None, forView: backView, cache: true)
        backView.alpha = 0.5
        UIView.commitAnimations()
        
    
    }
    
    private func donghuaView(view : UIView,rect : CGRect){
    
        UIView.beginAnimations("animationID", context: nil)
        UIView.setAnimationDuration(0.35)
        view .frame = rect
        
        UIView .setAnimationTransition(.None, forView: view, cache: true)
        UIView.commitAnimations()

    
    }
    
    
    /**黑色背景*/
    private func creatBackView(){
        
        
        backView = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT))
        backView.backgroundColor = UIColor.blackColor()
        self.addSubview(backView)
        backView.alpha = 0
        //添加点击手势
        let tap = UITapGestureRecognizer(target: self, action: "hiddenBackVew")
        tap.numberOfTapsRequired = 1
        backView.addGestureRecognizer(tap)

    
    }
    
    /**创建密码框*/
    private func creatPasswordView(){
        
        
        passWordView = UIView(frame: CGRectMake(10, SCREEN_HEIGHT, SCREEN_WIDTH - 20, 100))
        passWordView.backgroundColor = UIColor.whiteColor()
        passWordView.layer.cornerRadius = 6
        passWordView.layer.masksToBounds = true
        
        self.addSubview(passWordView)
        

        for(var i = 0 ; i < 6 ; i++){
            
            let la = UITextField(frame: CGRectMake((SCREEN_WIDTH - 240) / 2 + CGFloat(i * 40), 30, 40, 40))
            la.text = ""
            la.textAlignment = NSTextAlignment.Center
            la.enabled = false
            la.textColor = UIColor.blackColor()
            la.secureTextEntry = true
            la.font = UIFont.systemFontOfSize(14.0)
            la.layer.borderWidth = 1
            la.layer.borderColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0).CGColor
            passWordView.addSubview(la)
            textFields.addObject(la)
        }
    }

    /**创建数字键盘*/
    private func creatKeyBoardView(){
        
        
        KeyBoardView = UIView(frame: CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200))
        KeyBoardView.backgroundColor = UIColor.whiteColor()
        self.addSubview(KeyBoardView)
        
        let ary = ["1","2","3","4","5","6","7","8","9","0","清除","x"]
        
        for(var i = 0 ; i < ary.count; i++)
        {
            let l = i % 3
            let h = i / 3
            
            
            
            let btn = UIButton(frame: CGRectMake( CGFloat(l) * (SCREEN_WIDTH / 3),CGFloat(h) * 50, SCREEN_WIDTH / 3, 50))
            btn.tag = i
            btn.setTitle(ary[i] , forState: UIControlState.Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.layer.borderColor = UIColor(red: 225/255.0, green: 225/255.0, blue: 225/255.0, alpha: 1.0).CGColor
            btn.layer.borderWidth = 0.5
            
            if (i<=9){
                
                btn.addTarget(self, action: "KeyBoradClass:", forControlEvents: UIControlEvents.TouchUpInside)
            }
            
            if(i == 10){
                btn.addTarget(self, action: "KeyBoradClear:", forControlEvents: UIControlEvents.TouchUpInside)
                
            
            }
            if(i == 11){
                btn.addTarget(self, action: "KeyBoradRemove:", forControlEvents: UIControlEvents.TouchUpInside)
                
            }
            
            
            
            KeyBoardView.addSubview(btn)
            
        
        }
        
        
        
    
    
    }
    /**点击数字时走的方法*/
    func KeyBoradClass(btn : UIButton){
        
        let ary = ["1","2","3","4","5","6","7","8","9","0","清除","x"]
        
        tf1 = textFields[0] as! UITextField
        tf2 = textFields[1] as! UITextField
        tf3 = textFields[2] as! UITextField
        tf4 = textFields[3] as! UITextField
        tf5 = textFields[4] as! UITextField
        tf6 = textFields[5] as! UITextField
        
        if ((tf1.text! as NSString).length < 1){
        
        
            if ((tf1.text! as NSString).length == 0){
                
                tf1.text = ary[btn.tag]
                
            
            }
        
        }else if((tf2.text! as NSString).length < 1 && (tf1.text! as NSString).length == 1){
            
            if((tf2.text! as NSString).length == 0){
                tf2.text = ary[btn.tag]
            
            }
        
        
        }else if ((tf3.text! as NSString).length < 1 && (tf2.text! as NSString).length == 1){
            if((tf3.text! as NSString).length == 0){
                tf3.text = ary[btn.tag]
                
            }
        
        }else if ((tf4.text! as NSString).length < 1 && (tf3.text! as NSString).length == 1){
            if((tf4.text! as NSString).length == 0){
                tf4.text = ary[btn.tag]
                
            }
            
        }else if ((tf5.text! as NSString).length < 1 && (tf4.text! as NSString).length == 1){
            if((tf5.text! as NSString).length == 0){
                tf5.text = ary[btn.tag]
                
            }
            
        }else if ((tf6.text! as NSString).length < 1 && (tf5.text! as NSString).length == 1){
            if((tf6.text! as NSString).length == 0){
                tf6.text = ary[btn.tag]
                
            }
            
        }
        
       PassWordStr = "\(tf1.text!)" + "\(tf2.text!)"+"\(tf3.text!)"+"\(tf4.text!)"+"\(tf5.text!)"+"\(tf6.text!)"
        

        print("\(PassWordStr.length)")
        
        if (PassWordStr.length == 6){
            
           
           del.PassWordString!(PassWordStr as String)
            
            hiddenBackVew()
        
        }
        
        
    }
    
    /**清空*/
    func KeyBoradClear(btn : UIButton){
        
        tf1.text! = ""
        tf2.text! = ""
        tf3.text! = ""
        tf4.text! = ""
        tf5.text! = ""
        tf6.text! = ""
    
    }
    
    /**删除*/
    func KeyBoradRemove(btn : UIButton){
    
        if PassWordStr.length == 0 {
            
            tf1.text! = ""
            tf2.text! = ""
            tf3.text! = ""
            tf4.text! = ""
            tf5.text! = ""
            tf6.text! = ""

            return
        
        }
        
        let str = PassWordStr .substringToIndex(PassWordStr.length - 1)
        
        print("\(str)")
        if (str as NSString).length == 6 {
        
        }
        else if (str as NSString).length == 5 {
            
            tf6.text! = ""
    
        } else if (str as NSString).length == 4 {
            tf6.text! = ""
            tf5.text! = ""
            
            
        } else if (str as NSString).length == 3 {
            
            tf6.text! = ""
            tf5.text! = ""
            

            tf4.text! = ""
            
        } else if (str as NSString).length == 2 {
            
            
            tf6.text! = ""
            tf5.text! = ""
            
            
            tf4.text! = ""
            tf3.text! = ""
            
        } else if (str as NSString).length == 1 {
            tf6.text! = ""
            tf5.text! = ""
            
            
            tf4.text! = ""
            tf3.text! = ""
            tf2.text! = ""
            
        }else{
            
            tf6.text! = ""
            tf5.text! = ""
            
            
            tf4.text! = ""
            tf3.text! = ""
            tf2.text! = ""

            tf1.text! = ""
        
        }
        
        PassWordStr = str
        
        
        
    
    }
    
    func hiddenBackVew(){
        
        self.removeFromSuperview()
        
    
    }
    
    
    
    
    
}
