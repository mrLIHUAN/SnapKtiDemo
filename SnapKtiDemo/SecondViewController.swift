//
//  SecondViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit


//typealias sendValueClosure = (Title:String,Value:String)->Void
//
//typealias oneValueClosure = (name:String) -> Void

//typealias InputClosureType = (String) -> Void

class SecondViewController: UIViewController,UITextFieldDelegate {
    var btn:UIButton!
    var btnColor:UIColor!
//    private var myClosure:sendValueClosure?
//    private var myClosure1:oneValueClosure?
    
    
    //闭包变量
    var sendValueClosure :((name:String)->())!
    
    
//    func onWihtClosure(result:oneValueClosure){
//    
//        myClosure1 = result
//    }

    
//    func setBackMyClosure(tempClosure:InputClosureType){
//        self.backClosure = tempClosure
//    
//    }
//    
//    
//    var backClosure:InputClosureType?
    
    
    
    var kWidth:CGFloat!
    var topView:UIView!
    var textField:UITextField!
    
    var str:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        kWidth = self.view.bounds.width
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        topView1()
        createUI()
    }
    func topView1(){
        topView = UIView(frame: CGRectMake(0, 0, kWidth, 54))
        topView.backgroundColor = UIColor.redColor()
        
        self.view .addSubview(topView)
        
        let btn = UIButton(frame: CGRectMake(10, 20, 50, 54 - 20))
        btn.setTitle("取消", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "Goback", forControlEvents: UIControlEvents.TouchUpInside)
        topView.addSubview(btn)
    }
    
    func createUI(){
        
        textField = UITextField()
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField.delegate = self
        textField.placeholder = "输入一段文字"
        self.view .addSubview(textField)
        
        
        textField.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(topView.snp_bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
        
        btn = UIButton()
        btn.setTitle("确定", forState: UIControlState.Normal)
        btn.backgroundColor = btnColor
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.lightGrayColor().CGColor
        btn.addTarget(self, action: "OK", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        btn.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(textField.snp_bottom).offset(20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(44)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        str = textField.text
    }
    
    func OK(){
        
        textField.resignFirstResponder()
        
        
        //回调闭包
        self.sendValueClosure(name:str)
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    
    }
    
    func setBackMyClosure(tempClosure:(title:String,value:String)->()){
        tempClosure(title: "lihuan", value: "1")
        
    }
    
    func Goback(){
        self.dismissViewControllerAnimated(true, completion: nil)
    
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
