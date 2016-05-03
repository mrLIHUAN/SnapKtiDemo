//
//  MyTextView.swift
//
//
//  Created by 东正 on 16/1/18.
//  Copyright © 2016年  All rights reserved.
// 带placeholder 的textView

import UIKit

class MyTextView: UITextView {
    var placeHolderLabel:UILabel!
    var placeholder = String(){
        didSet{
            if(placeHolderLabel != nil && oldValue != placeholder){
                self.placeHolderLabel.removeFromSuperview()
                self.placeHolderLabel = nil
                self.setNeedsDisplay()
            }
        }
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        placeholder = ""
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textChanged:", name: UITextViewTextDidChangeNotification, object: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textChanged(notification:NSNotification){
        if(self.placeholder.characters.count == 0){
            return
        }
        
        if(self.text.characters.count == 0){
            self.viewWithTag(8732)?.alpha = 0.5;
        }else{
            self.viewWithTag(8732)?.alpha = 0;
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        if(self.placeholder.characters.count > 0){
            if(placeHolderLabel == nil){
                placeHolderLabel = UILabel(frame: CGRectMake(8, 8, self.bounds.size.width - 16, 0))
                self.addSubview(placeHolderLabel)
                placeHolderLabel.snp_makeConstraints(closure: { (make) -> Void in
                    make.left.equalTo(8)
                    make.top.equalTo(8)
                    make.right.equalTo(-16)
                })
                placeHolderLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
                placeHolderLabel.numberOfLines = 0
                placeHolderLabel.font = self.font
                placeHolderLabel.backgroundColor = UIColor.clearColor()
                placeHolderLabel.textColor = UIColor.blackColor()
                placeHolderLabel.alpha = 0
                placeHolderLabel.tag = 8732
            }
            placeHolderLabel.text = placeholder
            placeHolderLabel.sizeToFit()
            self.sendSubviewToBack(placeHolderLabel)
        }
        if(self.text.characters.count == 0 && self.placeholder.characters.count > 0){
            self.viewWithTag(8732)?.alpha = 0.5
        }
    }

}
