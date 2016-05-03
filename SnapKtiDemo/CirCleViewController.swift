//
//  CirCleViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/25.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class CirCleViewController: UIViewController,CirCleViewDelegate{

    
    var circleView: CirCleView!
    
    var index : Int!
    

    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController!.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController!.setNavigationBarHidden(true, animated: false)
        
        navgoBack()

        self.view.backgroundColor = UIColor.whiteColor()
        //MARK 轮播图
                self.automaticallyAdjustsScrollViewInsets = false
                let imageArray: [UIImage!] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg"),UIImage(named: "four.jpg") , UIImage(named: "5.jpg")];
        
                self.circleView = CirCleView(frame: CGRectMake(0, 64, self.view.frame.size.width, 200), imageArray: imageArray)
                circleView.backgroundColor = UIColor.orangeColor()
        
                circleView.del = self
                self.view.addSubview(circleView)

        // Do any additional setup after loading the view.
    }

    func navgoBack(){
        
        let btn = UIButton()
        btn.setTitle("back", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "back", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        btn.snp_makeConstraints { (make) -> Void in
            make.left .equalTo(10)
            make.width .equalTo(50)
            make.top.equalTo(20)
            make.height.equalTo(30)
        }
        
        
    }
    
    func back(){
//        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewControllerAnimated(true)
    
    }
    
    func clickCurrentImage(currentIndex: Int) {
        
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
