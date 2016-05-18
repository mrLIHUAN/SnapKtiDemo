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
        
        SortingAlgorithmUtils.SortFromSmallToBig(arr, SortStyle: SortType.insertSort) { (endarr) -> () in
            print("\(endarr)")
        }
        
        
        let arr1 = NSMutableArray()
//        for var i = 0 ; i < 10 ; ++i{
//            
//            let people = Person()
//            people.age = NSString(format:"%d", 10 - (i + 1))
//            people.name1 = NSString(format: "lihuan%d",i)
//            
//            print("\(people.name1)++\(people.age)")
//            arr1.addObject(people)
//        
//        }
//        
        
        
        let people = Person()
        people.age = "05"
        people.name1 = "li5"
        
        arr1.addObject(people)
        
        let people1 = Person()
        people1.age = "21"
        people1.name1 = "li21"
        
        arr1.addObject(people1)
        
        
        let people2 = Person()
        people2.age = "10"
        people2.name1 = "li10"
        
        arr1.addObject(people2)
        
        let people3 = Person()
        people3.age = "03"
        people3.name1 = "li1"
        
        arr1.addObject(people3)
        
        
        SortingAlgorithmUtils.sortFromSmallToBig(arr1, Sort: "age", SortStyle: SortType.SelectionSort) { (endarr) -> () in
            
            let _ : Person!
            for people1 in endarr{


                print(people1.name1,people1.age)
            
            }

            
        }
        
       
        // Do any additional setup after loading the view.
    }

//    func sortFromSmallToBig(array:NSMutableArray,SortEnd:(endarr:NSMutableArray)->()) {
//        
//        //走多少趟
////        var eeee = NSClassFromString(Typeee)
//        
//        for var i = 0;i < array.count - 1; ++i{
//            //从后往前
//            for var j = array.count - 1;j>i;--j{
//                
//                let modelj = array.objectAtIndex(j) as! Person
//                
//                let modelj_1 = array.objectAtIndex(j - 1) as! Person
//                
//                if modelj.name1 .compare(modelj_1.name1 as String, options: NSStringCompareOptions.CaseInsensitiveSearch) == NSComparisonResult.OrderedAscending{
//                    
//                    array .exchangeObjectAtIndex(j, withObjectAtIndex: j - 1)
//                    
//                }
//
//            }
//        }
//        
//        SortEnd(endarr: array)
//    }

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
