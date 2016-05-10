//
//  ViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import SnapKit


var kwidth1:CGFloat = UIScreen .mainScreen().bounds.size.width



class ViewController: UIViewController,UITextFieldDelegate,CirCleViewDelegate,UITableViewDataSource,UITableViewDelegate
{

    var oldPassWord:UITextField!
    var newPassWord:UITextField!
    var confirmPassword:UITextField!
    var formView:UIView!
    var confirmButton:UIButton!
    var topConstraint:Constraint?
    
    var account : String!
    
    var mainTablView:UITableView!
    
    var kwidth:CGFloat = 0.0
    
    var keyboard : CGFloat = 0.0
    
    var circleView: CirCleView!
    
    var names : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.redColor()
//        self.navigationController?.navigationBar.translucent = false
        
        
        let btn = UIButton(frame:CGRectMake(0, 0, 50, 30));
        btn .setTitle("编辑", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(14)
        btn.addTarget(self, action: "ffff", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        

        names = ["贝塞尔曲线","轮播图","底部评论视图","不一样的下拉刷新","密码框","文件下载"];
        
        
//        let btn = UIButton()
//        btn.setTitle("城市选择", forState: UIControlState.Normal)
//        btn.backgroundColor = UIColor.grayColor()
//        
//        btn.layer.cornerRadius = 5
//        btn.layer.masksToBounds = true
//        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
//        btn.addTarget(self, action: "chooseCity", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(btn)
//        
//        btn.snp_makeConstraints { (make) -> Void in
//            make.width.equalTo(100)
//            make.top.equalTo(0)
//            make.centerX.equalTo(self.view.snp_centerX)
//            make.height.equalTo(40)
//        }
//        
//
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
//            
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                
//            })
//        }
//        
//        
//        
//        let queue = dispatch_queue_create("ddd", DISPATCH_QUEUE_CONCURRENT)
//        
//        
        
        mainTablView = UITableView(frame:CGRectMake(0, 0, self.view.bounds.width , self.view.bounds.height) , style: UITableViewStyle.Plain)
        mainTablView.delegate = self
        mainTablView.dataSource = self
        self.view .addSubview(mainTablView)
        
        
        mainTablView.allowsMultipleSelectionDuringEditing = true
//        
//        let doc : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
////        let path = (d .stringByAppendingPathComponent("ShopCart.sqlite")
//        let path = doc.stringByAppendingPathComponent("ShopCart.sqlite")
//
//        print("\(path)")
        
//        kwidth = self.view.bounds.width
//        s
//        //MARK 轮播图
//        
//        self.automaticallyAdjustsScrollViewInsets = false
//        let imageArray: [UIImage!] = [UIImage(named: "first.jpg"), UIImage(named: "second.jpg"), UIImage(named: "third.jpg"),UIImage(named: "four.jpg") , UIImage(named: "5.jpg")];
//        
//        self.circleView = CirCleView(frame: CGRectMake(0, 64, self.view.frame.size.width, 200), imageArray: imageArray)
//        circleView.backgroundColor = UIColor.orangeColor()
//
//        circleView.del = self
//        self.view.addSubview(circleView)
//        
//        
//        let addImageBtn = UIButton()
//        
//        addImageBtn .setTitle("addImageBtn", forState: UIControlState.Normal)
//        addImageBtn .backgroundColor = UIColor.redColor()
//        addImageBtn .setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        addImageBtn .addTarget(self, action: "setImage", forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addSubview(addImageBtn)
//
//        addImageBtn.snp_makeConstraints { (make) -> Void in
//            make.left.equalTo(20)
//            make.right.equalTo(-20)
//            make.top.equalTo(circleView.snp_bottom).offset(20)
//            make.height.equalTo(30)
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
        //第一个练习
//        createSubView()
        //第二个练习
        
//        createSubView()
        
//        initUI()
        
//        let sin:SingleTon = SingleTon.sharedInstance
        
        
        showtime()
    
        NSNotificationCenter .defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardDidShowNotification, object: nil)
        
        
        
        
        
        
        
//
//    [NetWorkCore.addDataWith("ffff", result: { (data) -> () in
//        
//        print("\(data)")
//        
//        }) { (str) -> () in
//            print("\(str)")
//        }]
//        
        
        
//        createBtn()
        showName { () -> () in
            print("jieshu")
        }
//        var finsh:()->(String)
//        var st:String
//        finsh =  {
//            return "1"
//        }
//        var index = finsh()
        
//        print(index)
    }
    
//    func createBtn(){
//        
//
//        var btn = UIButton(frame: CGRectMake(10, 20, 100, 200))
//        
//    
//    }
    
//    func 
    
    func ffff(){
        

        mainTablView.editing = true
        mainTablView.setEditing(true, animated: true)
    
    }
    
    
    func chooseCity(){
        
//        let cityVC = CFCityPickerVC()
//        
//        cityVC.hotCities = ["北京","上海"]
//        
//        let navVC = UINavigationController(rootViewController: cityVC)
//        navVC.navigationBar.barStyle = UIBarStyle.BlackTranslucent
//        
//        
//        self.presentViewController(navVC, animated: true, completion: nil)
        

        let VC = PresentViewController()
//        VC.view.backgroundColor = UIColor.whiteColor()
//        let nav = UINavigationController(rootViewController: VC)
//        nav.navigationBar.tintColor = UIColor.redColor()
//        nav.navigationBar.translucent = true

//        self.presentViewController(nav, animated: true, completion: nil)
        VC.title = "贝塞尔曲线"
        self.navigationController?.pushViewController(VC, animated: true)
        

    }
    
    /** 轮播图*/
    func lunbotu(){
        
        let vc = CirCleViewController()
        vc.title = "轮播图"
        vc.index = 1
        self.navigationController?.pushViewController(vc, animated: true)
        
    
    }
    /** 底部评论视图*/
    func bottomView(){
        let vc = CommentViewController()
        vc.title = "底部评论视图"
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    /**不一样的下拉刷新*/
    func refreshViewcontroller(){
        let vc = RefreshViewController()
        vc.title = "动画刷新"
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    /**密码框*/
    
    func KeyboardView(){
        
        let vc = KeyboardViewController()
        vc.title = "密码框"
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    /**文件下载*/
    func filemanager(){
        
        let vc = DownLoadViewController()
        vc.title = "文件下载"
        self.navigationController?.pushViewController(vc, animated: true)
        
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return names.count;
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cellID = "cell1"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
            cell = MainTableViewCell(style: .Default, reuseIdentifier: cellID, str: names[indexPath.row])
        }
        
//        cell?.accessoryType
//        cell?.textLabel?.text = names[indexPath.row]
        
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
//        if indexPath.row == 0{
//            
//            chooseCity()
//            
//        }
        if tableView.editing == true{
        
        }else{
        
        switch indexPath.row {
            
        case 0 : chooseCity()
            break
        case 1 : lunbotu()
            break
        case 2 : bottomView()
            break
        case 3 : refreshViewcontroller()
            break
        case 4 : KeyboardView()
            break
        case 5 : filemanager()
            break
        default :break
        
        }
        }
        
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.Delete){
//            self.dataList.removeObjectAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    /** 处理tabView分隔线无法到头的代码 */
    override func viewDidLayoutSubviews() {
        
        if mainTablView.respondsToSelector(Selector("setSeparatorInset:")){
            
            mainTablView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0)
            
        
        }
        
        if mainTablView.respondsToSelector(Selector("setLayoutMargins:")){
            mainTablView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
            
        }
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if cell.respondsToSelector(Selector("setSeparatorInset:")){
            cell.separatorInset = UIEdgeInsetsZero
        }
        
        
        if cell.respondsToSelector(Selector("setLayoutMargins:")){
            cell.layoutMargins = UIEdgeInsetsZero
        }
    }
    
    
    
    func setImage(){
        circleView.urlImageArray = ["http://pic1.nipic.com/2008-09-08/200898163242920_2.jpg"]
    
    }
    
    
    func showtime(){
        
        let date = NSDate()
        
//        let dateDescription = date.description as NSString
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
       let dateString = formatter.stringFromDate(date)
        
        print("+++\(dateString)")
//
//        let str = "qwertyuioplkjhgfdsazxcvbnm" as NSString
//        
//        let data = str .dataUsingEncoding(NSUTF8StringEncoding)
//        
//        print("\(data)")
//        
//        let str2 = NSString(data: data!, encoding: NSUTF8StringEncoding)
//        
//        print("\(str2)")
        
        
    
    
    }
    

    //轮播图代理
    func clickCurrentImage(currentIndex: Int) {
        
        print("\(currentIndex)")
    }
    
    
    func showName(finsh:() ->()){
        print("han")
        finsh()
    }
    
    func keyboardWillShow(notif:NSNotification){
        
        let userInfo:NSDictionary = notif.userInfo!;
//        let keyBoardInfo: AnyObject? = userInfo.objectForKey(UIKeyboardFrameBeginUserInfoKey);
//        let beginY = keyBoardInfo?.CGRectValue.origin.y;
        let keyBoardInfo2: AnyObject? = userInfo.objectForKey(UIKeyboardFrameEndUserInfoKey);
        let endY = keyBoardInfo2?.CGRectValue.size.height;
        
        
        keyboard = endY!
        
        
        print("\(keyboard)")
    
    }
    
    
    func showDatePickView()->UIDatePicker{

        let pickView = UIDatePicker(frame: CGRectMake(0, 0,kwidth, 258.0) )
        pickView.backgroundColor = UIColor.whiteColor()
        
        pickView.minimumDate = NSDate()
        
//        pickView.datePickerMode = UIDatePickerMode.Date
        pickView.addTarget(self, action: "datePickerValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        return pickView
    
    }
    
    func datePickerValueChanged(datePicker:UIDatePicker){
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = formatter .stringFromDate(datePicker.date)
        oldPassWord.text = dateStr
        
    }
    
    
    func initUI(){
        self.view.backgroundColor = UIColor.redColor()
        //登录框背景
        self.formView = UIView()
        self.formView.layer.borderWidth = 0.5
        self.formView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.formView.backgroundColor = UIColor.whiteColor()
        self.formView.layer.cornerRadius = 5
        self.view .addSubview(self.formView)
        
        //最常规的设置模式
        self.formView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            
            //存储TOP
            self.topConstraint = make.top.equalTo(200).constraint
            make.height.equalTo(220)
        }
        
        self.oldPassWord = UITextField()
        self.oldPassWord.delegate = self
        self.oldPassWord.tag = 100
        self.oldPassWord.placeholder = "请输入手机号"
        self.oldPassWord.layer.borderWidth = 0.5
        self.oldPassWord.layer.cornerRadius = 5
        self.oldPassWord.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.oldPassWord.inputView = showDatePickView()
//        self.oldPassWord.returnKeyType = UIReturnKeyType.Next
        
        self.formView.addSubview(self.oldPassWord)
        self.oldPassWord.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.top.equalTo(20)
            make.right.equalTo(-10)
            make.height.equalTo(44)
        }
        
        
        
        self.newPassWord = UITextField()
        self.newPassWord.delegate = self;
        
        self.newPassWord.tag = 101
        self.newPassWord.placeholder = "请输入密码"
        self.newPassWord.layer.cornerRadius = 5
        self.newPassWord.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.newPassWord.layer.borderWidth = 0.5
        self.newPassWord.returnKeyType = UIReturnKeyType.Next
        
        self.formView.addSubview(self.newPassWord)
        
        self.newPassWord.snp_makeConstraints { (make) -> Void in
            
            
            make.left.equalTo(self.oldPassWord.snp_left)
            make.height.equalTo(44)
            make.top.equalTo(self.oldPassWord.snp_bottom).offset(20)
            make.right.equalTo(-10)
        }
       
        
        self.confirmPassword = UITextField()
        self.confirmPassword.delegate = self
        self.confirmPassword.tag = 102
        self.confirmPassword.placeholder = "请重复密码"
        self.confirmPassword.layer.cornerRadius = 5
        self.confirmPassword.layer.borderWidth = 0.5
        self.confirmPassword.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.confirmPassword.returnKeyType = UIReturnKeyType.Done
        
        self.formView.addSubview(self.confirmPassword)
        
        self.confirmPassword.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(self.newPassWord.snp_left)
            make.height.equalTo(44)
            make.right.equalTo(-10)
            make.top.equalTo(self.newPassWord.snp_bottom).offset(20)
            
            
        }
        
        
        self.confirmButton = UIButton()
        self.confirmButton.setTitle("确认", forState: UIControlState.Normal)
        self.confirmButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        self.confirmButton.tapBtn { [weak self]() -> () in
            
            
            
            let con = SecondViewController()
            /**
            *  @author lh, 16-03-31 10:03:50
            *
            *  闭包变量传值
            */
            con.sendValueClosure = { (name)->() in
                print("+++++cccc\(name)")
            }
            

            
            
            
            /**
            这写的比较low
            */
            //        con.initWithClosure(postMessage)
            //        con.initWithClosure(UIColor.redColor()) { (Title, Value) -> Void in
            //
            //            self.oldPassWord.text = Value
            //        }
            //
            
            //        con.onWihtClosure { (name) -> Void in
            //            print("++++++\(name)")
            //        }
            
//            con.setBackMyClosure { (title, value) -> () in
//                print("\(title),\(value)")
//                
//                
//                
//            }
            
            
            
            
            
            
            //        con.onWihtClosure(postMessage)
            
            
            
            self!.presentViewController(con, animated: true, completion:nil)
        
            
            
            
        }
        
        
        
        
        
        
        self.confirmButton.layer.cornerRadius = 5
        self.confirmButton.backgroundColor = UIColor(colorLiteralRed: 0.99, green: 0.82, blue: 0.04, alpha: 1)
//        self.confirmButton.addTarget(self, action: "gogogo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(self.confirmButton)
        
        self.confirmButton.snp_makeConstraints { (make) -> Void in
            
            make.left.equalTo(15)
            make.top.equalTo(self.formView.snp_bottom).offset(20)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
    }
    
    /**
     textFieldDelegte
     
     - parameter textField: <#textField description#>
     */
    func textFieldDidBeginEditing(textField: UITextField) {
        
        let tag = textField.tag
        switch tag{
        case 100:
//            
            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.topConstraint!.uninstall()
                
                self.topConstraint?.updateOffset(70)
//
     
                
//                self.formView.snp_remakeConstraints(closure: { (make) -> Void in
//
//                    make.top.equalTo(100)
//                    make.left.equalTo(15)
//                    make.right.equalTo(-15)
//                    make.height.equalTo(220)
//                })
                self.view.layoutIfNeeded()
            })
             break
        case 101:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(70)
                self.view.layoutIfNeeded()
            })
            
            
            break
        case 102:
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(70)
                self.view.layoutIfNeeded()
            })
            break
        default:
            break
        }
        
    }
    func textFieldDidEndEditing(textField: UITextField) {
        if (textField.tag == 100){
            account = textField.text
        
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let tag = textField.tag
        switch tag{
        case 100:
            
            self.newPassWord.becomeFirstResponder()
            break
        case 101:
            self.confirmPassword.becomeFirstResponder()
            break
        case 102:
            textField.resignFirstResponder()
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.topConstraint?.updateOffset(200)
                self.view.layoutIfNeeded()
            })
            
            break
        default:
            break
            
        }
        
        
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let str = string as NSString
        
        if (str.length != 0){
            if (textField.tag == 100){
                if((textField.text! as NSString).length>=13){
                    
                    return false
                
                }
                
                if ((textField.text! as NSString).length == 3||(textField.text! as NSString).length == 8){
                    
                    let str = " " as NSString
                    let str1 = textField.text! as NSString
                    
                    textField.text = str1.stringByAppendingString(str as String)
                
                }
            }
            
            
            if (textField.tag == 101 || textField.tag == 102){
                if((textField.text! as NSString).length >= 8){
                    return false
                }
            }
        }
        
        return true
        
    }
    
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {

        self.view.endEditing(true)
        
        UIView.animateWithDuration(0.5) { () -> Void in
            
            self.topConstraint?.updateOffset(200)
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    
    
    /**
     第一个视图布局的练习
     */
//    func createSubView(){
//        
//        let subView = UIView()
//        
//        subView.backgroundColor = UIColor.redColor()
//        
//        self.view .addSubview(subView)
//        
//     //一个边一个边的设置
////        subView.snp_makeConstraints { (make) -> Void in
////            make.top.equalTo(self.view).offset(20)
////            make.left.equalTo(self.view).offset(20)
////            make.bottom.equalTo(self.view).offset(-20)
////            make.right.equalTo(self.view).offset(-20)
////        }
//        //简写形式
//        subView.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(20, 20, 20, 20))
//        }
//        
//    
//    }
    
    
//         func createSubView(){
//    
//
//        
//        let subView = UIView()
//        subView.backgroundColor = UIColor.redColor()
//        self.view .addSubview(subView)
//        
//        subView.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(42)
//            make.bottom.equalTo(self.view).offset(-500)
//            make.left.equalTo(10)
//            make.right.equalTo(-10)
//        }
//        
//        
//        let s = UIView()
//        s.backgroundColor = UIColor.blueColor()
//        self.view .addSubview(s)
//        s.snp_makeConstraints { (make) -> Void in
//            
//            make.top.equalTo(subView.snp_bottom).offset(20)
//            make.left.equalTo(subView.snp_left)
//            make.width.equalTo(100)
//            make.height.equalTo(subView.snp_height)
//        }
//        
//        
//        let s2 = UIView()
//        s2.backgroundColor = UIColor.blueColor()
//        self.view .addSubview(s2)
//        s2.snp_makeConstraints { (make) -> Void in
//            make.right .equalTo(subView.snp_right)
//            make.top .equalTo(subView.snp_bottom).offset(20)
//            make.height.equalTo(subView.snp_height)
//            make.width.equalTo(100)
//            
//        }
//        
//        
//        
//        
//        
//////
//        
//
//    
//    }
//    
    
    func gogogo(){
        
        print("\(account)")
        
        let con = SecondViewController()
        
//        con.initWithClosure(postMessage)
//        con.initWithClosure(UIColor.redColor()) { (Title, Value) -> Void in
//            
//            self.oldPassWord.text = Value
//        }
//        
        
//        con.onWihtClosure { (name) -> Void in
//            print("++++++\(name)")
//        }
        
        con.setBackMyClosure { (title, value) -> () in
            print("\(title),\(value)")
            
            
            
        }
        
        
//        con.onWihtClosure(postMessage)
        
        
        self.presentViewController(con, animated: true, completion:nil)
    }
    
    
    
    func postMessage(string:String){
        
        oldPassWord.text = string
    
    
    }
    

//    override func layoutSubviews() {
//            super.layoutSubviews()
//            for control in self.subviews{
//                if control.isMemberOfClass(NSClassFromString("UITableViewCellEditControl")!){
//                    for v in control.subviews{
//                        if(v.isKindOfClass(UIImageView)){
//                            let img = v as! UIImageView
//                            if(self.selected){
//                                img.image = UIImage(named: "fszc_mainmap_dianzhuang.png")
//                            }else{
//                                img.image = UIImage(named: "fszc_daohangimage.png")
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    
    

       

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

