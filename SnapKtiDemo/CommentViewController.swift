//
//  CommentViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/26.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController,MainCommentBtndelegate{

    
    var bottomView : MainCommentView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //分享
        
        
        let btn3 = UIButton(frame: CGRectMake(100, 100, 100, 100) )
        btn3.backgroundColor = UIColor.redColor()
        btn3.tag = 1003
        //        btn3.backgroundColor = UIColor.blueColor()
        btn3.setTitle("分享", forState: UIControlState.Normal)
        btn3.titleLabel?.font = UIFont.systemFontOfSize(12)
        btn3.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn3.setImage(UIImage(named: "分享"), forState: UIControlState.Normal)
        btn3.setVerticalLabelBottom(5)
//        btn3.addTarget(self, action: "onClick:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn3)
//        btn3.snp_makeConstraints { (make) -> Void in
//            make.right.equalTo(-)
//            make.height.equalTo()
//            make.top.equalTo()
//            make.width.equalTo(30)
//        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillChange:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardwillhidden:", name: UIKeyboardWillHideNotification, object: nil)
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        creatBottomView()
    }

    
    
    //键盘的监听l
    var heightkk:CGFloat = 0
    func keyboardWillChange(notif:NSNotification){
        
        let userInfo:NSDictionary = notif.userInfo!;
        let keyBoardInfo2: AnyObject? = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey);
        let endY = keyBoardInfo2?.CGRectValue.size.height;
        let aTime = userInfo.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSTimeInterval
        UIView.animateWithDuration(aTime, animations: { () -> Void in
            
            self.bottomView.transform = CGAffineTransformMakeTranslation(0, -endY!)
        })
    }
    func keyboardwillhidden(noti:NSNotification){
        UIView.animateWithDuration(0.25) { () -> Void in
            self.bottomView.transform = CGAffineTransformIdentity
        }
    }

     func creatBottomView(){
        bottomView = MainCommentView(frame: CGRectZero , btnNames: ["分享","收藏","评论"])
        bottomView.del = self
        /**如果没有收藏属性的话 此属性可选属性*/
//        bottomView.collectionState = "1"
        self.view .addSubview(bottomView)
            bottomView.snp_makeConstraints { (make) -> Void in
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.height.equalTo(55)
                make.bottom.equalTo(self.view.snp_bottom)
            }
    }


    func mainCommentBtn(index: Int, commentText: String, isShoucang: String) {
        print("\(index),\(commentText),\(isShoucang)")
    }
    
   
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    
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
