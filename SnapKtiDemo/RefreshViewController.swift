//
//  RefreshViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

extension UITableView {
    
    func setTopAnimation(){
       
//        
        let kw = UIScreen.mainScreen().bounds.size.width
        
        let kh = UIScreen.mainScreen().bounds.size.height
        let view1 = RYCuteView(frame: CGRectMake(0,0 , kw, kh))
        self.addSubview(view1)
        

    }
    
}
class RefreshViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let tabView1 = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        tabView1.backgroundColor = UIColor.clearColor()
        tabView1.delegate = self
        tabView1.dataSource = self
        tabView1.setTopAnimation()
        self.view.addSubview(tabView1)
        
        tabView1.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cellID = "cell1"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil{
            
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
//            cell?.backgroundColor = UIColor.clearColor()
        }
        
//        cell?.textLabel?.text = names[indexPath.row]

        return cell!
        
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
