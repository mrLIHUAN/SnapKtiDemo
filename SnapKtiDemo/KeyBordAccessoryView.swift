//
//  KeyBordAccessoryView.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit



class KeyBordAccessoryView: UIView {
//取消
    var canNoInPut : UIButton!
//完成
    var canSureInPut : UIButton!
//中间Label
    var label = UILabel()
    
    
    
    /**“取消”字体的颜色*/
    var canNoInputTitleColor : UIColor!{
        didSet{
            canNoInPut.setTitleColor(canNoInputTitleColor, forState: UIControlState.Normal)
        }
    
    }
    
    /**“确定”字体的颜色*/
    var canSureInputTitleColor : UIColor!{
        didSet{
            canSureInPut.setTitleColor(canSureInputTitleColor, forState: UIControlState.Normal)
        }
    }
    
    /**“取消”背景颜色*/
    var canNoInputBGColor : UIColor!{
        didSet{
            canNoInPut.backgroundColor = canNoInputBGColor
        }
    }
    
    /**“确定”背景颜色*/
    var canSureInputBGColor : UIColor!{
        didSet{
            canSureInPut.backgroundColor = canSureInputBGColor
            
        }
    }

    /**“中间”字体的颜色*/
    var middleTitleColor : UIColor!{
        didSet{
            
        label.textColor = middleTitleColor
        }
    
    }
    
    /**“确定”“取消”字体大小 */
    var fontSize : UIFont!{
        didSet{
            canNoInPut.titleLabel?.font = fontSize
            canSureInPut.titleLabel?.font = fontSize
        
        }
    
    }
    
    
    
    
    
    
    init(frame: CGRect,middleTitle : String) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        creatLeftBtn()
        creatRightBtn()
        creatMiddleLabel(middleTitle)
        creatline()

    }
    
    
    
    
    //左边btn
    func creatLeftBtn(){
        canNoInPut = UIButton()
        self.addSubview(canNoInPut)
        canNoInPut.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.width.equalTo(55)
            make.top.equalTo(9)
            make.bottom.equalTo(-9)
        }
        canNoInPut.setTitle("取消", forState: UIControlState.Normal)
        
        canNoInPut.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        canNoInPut.addTarget(self, action: "actionBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        canNoInPut.layer.cornerRadius = 12
        canNoInPut.layer.masksToBounds = true
        canNoInPut.backgroundColor = UIColor.groupTableViewBackgroundColor()
    }
    
    //右边btn
    func creatRightBtn(){
        
        canSureInPut = UIButton()
        self.addSubview(canSureInPut)
        canSureInPut.snp_makeConstraints { (make) -> Void in
            make.right.equalTo(-10)
            make.width.equalTo(55)
            make.top.equalTo(9)
            make.bottom.equalTo(-9)
        }
        canSureInPut.setTitle("完成", forState: UIControlState.Normal)
        canSureInPut.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        canSureInPut.layer.cornerRadius = 12
        canSureInPut.addTarget(self, action: "actionBtn:", forControlEvents: UIControlEvents.TouchUpInside)
        canSureInPut.layer.masksToBounds = true
        canSureInPut.backgroundColor = UIColor.groupTableViewBackgroundColor()
    
    }
   //中间Label
    func creatMiddleLabel(title : String){
       
        label.text = title
        label.textColor = UIColor.blackColor()
        self.addSubview(label)
        label.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp_centerX)
            make.centerY.equalTo(self.snp_centerY)
        }
        label.textAlignment = NSTextAlignment.Center

    }
    
    //上下两条线
    func creatline(){
        
        let topLine = UIView()
        self.addSubview(topLine)
        topLine.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.height.equalTo(0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        topLine.alpha = 0.5
        topLine.backgroundColor = UIColor(red: 128 / 255.0, green: 128 / 255.0, blue: 128 / 255.0, alpha: 1.0)
        
        let bottomLine = UIView()
        self.addSubview(bottomLine)
        bottomLine.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(0)
            make.height.equalTo(0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        bottomLine.alpha = 0.5
        bottomLine.backgroundColor = UIColor(red: 128 / 255.0, green: 128 / 255.0, blue: 128 / 255.0, alpha: 1.0)


    
    }
    
    /**两个btn的点击事件*/
    func actionBtn(btn : UIButton){
        if(btn == canNoInPut){
        
        print("取消")
            var nextRes = self.nextResponder()! as UIResponder
            
//            while(nextRes != nil){
//                if(nextRes!.isKindOfClass(UITextView)){
//                    let root = nextRes as! UITextView
//                    root.resignFirstResponder()
//                    return
//                }
//                
//                if(nextRes!.isKindOfClass(UITextField)){
//                    let root = nextRes as! UITextField
//                    root.resignFirstResponder()
//                    return
//                }
//            
//                nextRes = nextRes?.nextResponder()
//            
//            }
            
            
            repeat{
//                
                if ((nextRes.isKindOfClass(UITextView))){
                    
                    let t = nextRes as! UITextView
                    t.resignFirstResponder()
                    t.text = ""
                    return
                }
                if(nextRes.isKindOfClass(UITextField)){
                    let t = nextRes as! UITextField
                    t.text = ""
                    t.resignFirstResponder()
                    return
                }
                nextRes = nextRes.nextResponder()!
            }while(true)
            
            
        }else{
            
            var nextRes = self.nextResponder()! as UIResponder
            repeat{
                //
                if ((nextRes.isKindOfClass(UITextView))){
                    
                    let t = nextRes as! UITextView
                    t.resignFirstResponder()

                    return
                }
                
                if(nextRes.isKindOfClass(UITextField)){
                    let t = nextRes as! UITextField

                    t.resignFirstResponder()
                    return
                    
                }
                
                nextRes = nextRes.nextResponder()!
                
            }while(true)
        
        }
        
        
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
