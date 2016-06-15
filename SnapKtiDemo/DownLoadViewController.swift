//
//  DownLoadViewController.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/6.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
import SSZipArchive

class DownLoadViewController: UIViewController,NSURLConnectionDataDelegate,NSURLConnectionDelegate,NSURLSessionDownloadDelegate {

    let filePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory , NSSearchPathDomainMask.UserDomainMask, true).last! + "/master.zip"
    
    var label : UILabel!
    
    lazy var session : NSURLSession = {
        
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        
    }()
    
    var downloadTask : NSURLSessionDownloadTask!
    
    
    //总时长
    var totalLength : Double!
    //下载的长度
    var receviewTotal : Double = 0.0
    //缓冲数据(懒加载)
//    lazy var bufferData : NSMutableData = {
//        return NSMutableData()
//    }()
    
    var bufferData : NSMutableData?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        

        
        let btn = UIButton(frame: CGRectMake(100, 100, 100, 50))
        btn.setTitle("下载", forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.blueColor()
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(17)
        btn.addTarget(self, action: "action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        
        label = UILabel(frame: CGRectMake(100, 140, 100, 50))
        
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(17)
        label.textColor = UIColor.blackColor()
        self.view.addSubview(label)
        
        let btn1 = UIButton(frame: CGRectMake(100, 266, 100, 50))
        btn1.setTitle("解压", forState: UIControlState.Normal)
        btn1.backgroundColor = UIColor.blueColor()
        btn1.layer.cornerRadius = 5
        btn1.layer.masksToBounds = true
        btn1.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn1.titleLabel?.font = UIFont.systemFontOfSize(17)
        btn1.addTarget(self, action: "actionzip", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn1)

        let btn2 = UIButton(frame: CGRectMake(100, 366, 100, 50))
        btn2.setTitle("清理缓存", forState: UIControlState.Normal)
        btn2.backgroundColor = UIColor.blueColor()
        btn2.layer.cornerRadius = 5
        btn2.layer.masksToBounds = true
        btn2.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn2.titleLabel?.font = UIFont.systemFontOfSize(17)
        btn2.addTarget(self, action: "clear", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn2)
        
        print("\(filePath)")
        
        
        // Do any additional setup after loading the view.
    }
    
    func action(btn : UIButton){
        
        
        
        let url = NSURL(string: "https://github.com/mrLIHUAN/JSAndSwift/archive/master.zip")
        
        let request = NSURLRequest(URL: url!)

        NSURLConnection(request: request, delegate: self)
//        //创建文件路径
//        NSFileManager .defaultManager().createFileAtPath(filePath, contents: nil, attributes: nil)
        
//      downloadTask = session.downloadTaskWithURL(url!)
//        
//        downloadTask.resume()
    
    }
    
    
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        
       let httPURLResponse  = response as! NSHTTPURLResponse
        
        let dic = (httPURLResponse.allHeaderFields) as NSDictionary
        
        let length = dic.objectForKey("Content-Length")
        
        totalLength = length?.doubleValue
        
        print("\(totalLength)")
        
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        
        bufferData = NSMutableData()
        bufferData!.appendData(data)
        receviewTotal += Double(data.length)
        
        let progess = receviewTotal / totalLength
        
        label.text = String(format: "%0.2f%%", progess*100)

        let cn = CNCircleProgressView(frame: CGRectMake(100, 100, 200, 200))
        cn.updateProgressWithNumber(CGFloat(progess*100))
        self.view.addSubview(cn)

        if(bufferData!.length > 1 * 1000){
            appenFileData(bufferData!)
            bufferData = nil
        }
    }

    
    //把数据写入文件
    func appenFileData(data: NSData){
        
        let fileHandle = NSFileHandle(forWritingAtPath: filePath)
        fileHandle?.seekToEndOfFile()
        fileHandle?.writeData(data)
        fileHandle?.closeFile()
        
    }
    //解压缩
    func actionzip(){
        
        let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!
        SSZipArchive.unzipFileAtPath(filePath, toDestination: path)
    }

    func clear(){
        
        //计算目录文件大小

        let fileManager = NSFileManager.defaultManager()
//        var folderSize : Float
        
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).last!
        
        if (fileManager .fileExistsAtPath(path)){
            let childerFiles = fileManager.subpathsAtPath(path)
        
            for fileName in childerFiles! {
            
                let absolutePath = path.stringByAppendingString("/"+fileName)
                
                print("\(absolutePath)")
                
               try! fileManager.removeItemAtPath(absolutePath)
                
//               folderSize = try! fileManager.attributesOfItemAtPath(absolutePath)
                
            }
        
        }
        }
    
    
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
        
        var fileString = NSHomeDirectory() as NSString
        fileString = fileString.stringByAppendingPathComponent("/Documents/")
        let fileName = "/icon.zip"
        
        let url = NSURL(fileURLWithPath: "\(fileString)\(fileName)")
        let manager = NSFileManager .defaultManager()
        
       try? manager.moveItemAtURL(location, toURL: url)
        
        
        print("++++\(location)")
        
    }
    

    
    /**
    bytesWritten               : 本次下载的字节数
    totalBytesWritten          : 已经下载的字节数
    totalBytesExpectedToWrite  : 下载总大小
    */
    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print("+++\(bytesWritten)+++\(totalBytesWritten)---\(totalBytesExpectedToWrite)")

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
