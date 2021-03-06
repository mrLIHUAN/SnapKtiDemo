//
//  KeyboardViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController,PassStringDelegate {

    var passLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        let button = UIButton(frame: CGRectMake(100, 100, 100,50))
        button.setTitle("点击显示", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button.addTarget(self, action: "action", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        
        passLabel = UILabel(frame: CGRectMake(100, 120 , 100, 50))
    
        passLabel.textAlignment = .Center
        
        passLabel.textColor = UIColor.blackColor()
        
        passLabel.font = UIFont.systemFontOfSize(17)
        
        self.view.addSubview(passLabel)
        
    
        
        

        // Do any additional setup after loading the view.
    }
    
    func action(){
        
        let password = PasswordAndkeyBoard(frame: CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height))
        password.show()
        password.del = self
        self.view.addSubview(password)
    
    }
    
    func PassWordString(pass: String) {
        
        passLabel.text = pass
        print("\(pass)")
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
