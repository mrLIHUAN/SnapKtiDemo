//
//  MainCommentView.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

@objc protocol MainCommentBtndelegate : NSObjectProtocol{
    /**
     点击btn 通过代理传值
     
     - parameter index:       btn的位置
     - parameter commentText: 评论的内容
     - parameter isShoucang:  收藏 0：代表未收藏 1：代表收藏
     */
    optional func mainCommentBtn(index :Int, commentText: String, isShoucang:String)


}
/**
 *  @author 李欢, 16-04-27 14:04:04
 *
 *  现在好像没有用到
 */
@objc protocol MainTextFieldDataSource : NSObjectProtocol {
    
    optional func mainTextFieldWithString(string : String )

}
class MainCommentView: UIView , UITextViewDelegate{
    
    var width = UIScreen.mainScreen().bounds.width
    
    weak var del : MainCommentBtndelegate!
    weak var dataSource : MainTextFieldDataSource!
    
    /**写评论的TextView*/
    var textField = MyTextView()

    /**主要是确定评论输入框的宽度*/
    let screenWidth : CGFloat = UIScreen.mainScreen().bounds.width
    var textWidth : CGFloat!
    
    
    /**懒加载*/
    lazy var lastBtn : UIButton = {
      return UIButton()
    }()
    
    /**收藏btn*/
    lazy var shoucangBtn : UIButton = {
        return UIButton()
    
    }()
    /** 评论的内容*/
    var commentText : String!
    
    /**这个属性判断这个页面是否已经被收藏，如果有收藏功能可以设置0:代表没有收藏 1：已经收藏
        如果你写的工程没有牵扯到收藏次属性不需要赋值*/
    var collectionState : String! = "0"{
        didSet {
            if collectionState == "0"{
                shoucangBtn.setImage(UIImage(named: "收藏"), forState: UIControlState.Normal)
            }else{
                shoucangBtn.setImage(UIImage(named: "收藏 1"), forState: UIControlState.Normal)
            }
        
        
        }
    
    }
    
    init(frame: CGRect , btnNames:[String]) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.groupTableViewBackgroundColor()
        creatUI(btnNames)
        
    }
    func creatUI(btnNames:[String]){
        
        var i : Int
        let btnCount = btnNames.count
        
        for(i = 0 ; i < btnCount ; i++){
            
            let btn = UIButton()
            btn.tag = 1000 + i
            btn.setTitle(btnNames[i], forState: UIControlState.Normal)
            btn.setImage(UIImage(named: btnNames[i]), forState: UIControlState.Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(12)
            btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            btn.setVerticalLabelBottom(5)
            btn.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(btn)
            btn.snp_makeConstraints(closure: { (make) -> Void in
                make.right.equalTo(self.snp_right).offset(-(10 * i + 10 + 30 * i))
                make.width.equalTo(30)
                make.height.equalTo(self.snp_height)
                make.top.equalTo(self.snp_top)
                
            })
            
            
            if i == btnCount - 1 {
                
                lastBtn = btn
                
            }
            
            if btnNames[i] == "收藏" {
                
                shoucangBtn = btn
            }
        }
        
        
        textWidth = CGFloat(screenWidth)-CGFloat(btnCount * 30 + (btnCount + 2) * 10)
        /** 写评论*/
        textField.placeholder = "写评论"
        textField.returnKeyType = UIReturnKeyType.Done
        textField.font = UIFont.systemFontOfSize(15)
        textField.delegate = self
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = UIColor.grayColor().CGColor
        textField.layer.borderWidth = 1
        textField.layer.masksToBounds = true
        self.addSubview(textField)
        
        textField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.right.equalTo(lastBtn.snp_left).offset(-10)
            make.top.equalTo(10)
            make.bottom.equalTo(self.snp_bottom).offset(-10)
        }
    
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        let text = textView.text
        
        commentText = text
        
    }
    
    func textViewDidChange(textView: UITextView) {
        //高度
        let textSize = NSString(string: textView.text).sizeWithAttributes([NSFontAttributeName : textView.font!])
        if textSize.width >= textWidth {
            textField.snp_remakeConstraints(closure: { (make) -> Void in
                make.left.equalTo(10)
                make.right.equalTo(lastBtn.snp_left).offset(-10)
                make.top.equalTo(0)
                make.height.equalTo(self.snp_height)
            })
        }else{
            textField.snp_remakeConstraints(closure: { (make) -> Void in
                make.left.equalTo(10)
                make.right.equalTo(lastBtn.snp_left).offset(-10)
                make.top.equalTo(10)
                make.bottom.equalTo(self.snp_bottom).offset(-10)
            })
        }
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
    
        let textString : NSString = text as NSString
        
        if textString .isEqualToString("\n"){
            
        textView.resignFirstResponder()
            return false
        }
       return true
    }
    
    func onClick(btn : UIButton){
        textField.resignFirstResponder()
        if btn == shoucangBtn{
            if collectionState == "0" {
                collectionState = "1"
            }else{
                collectionState = "0"
            }
        }
        if commentText == nil{
            commentText = ""
        }
        del.mainCommentBtn!(btn.tag - 1000, commentText: commentText, isShoucang: collectionState)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
