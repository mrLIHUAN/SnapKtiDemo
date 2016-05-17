//
//  SortViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/17.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

class SortViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        
        
        var arr = [5,3,8,6,4];
        
        SortingAlgorithmUtils.SortFromSmallToBig(arr, SortStyle: SortType.BubbleSort) { (endarr) -> () in
            print("\(endarr)")
        }
        
        
        SortingAlgorithmUtils.SortFromSmallToBig(arr, SortStyle: SortType.SelectionSort) { (endarr) -> () in
            print("\(endarr)")
        }
        
    
        // Do any additional setup after loading the view.
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
