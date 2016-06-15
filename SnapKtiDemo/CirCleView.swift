//
//  CirCleView.swift
//  SnapKtiDemo
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

protocol CirCleViewDelegate{
    func clickCurrentImage(currentIndex: Int)

}


let TimeInterVal = 2.5  //全局的时间间隔
class CirCleView: UIView , UIScrollViewDelegate{
    
    var contentScrollView: UIScrollView!
    
    var pageIndicator:     UIPageControl!
    
    var timer:             NSTimer?
    
    
    var del : CirCleViewDelegate?
    var indexOfCurrentImage: Int! {
        //监听显示的第几张图片，来更新分页指示器
        didSet{
            self.pageIndicator.currentPage = indexOfCurrentImage
        }
    }
    
    
    var imageArray:[UIImage!]!{
       
        willSet(newValue){
            self.imageArray = newValue
        
        }
        didSet{
            contentScrollView.scrollEnabled = !(imageArray.count == 1)
            self.pageIndicator.frame = CGRectMake(self.frame.size.width - 20 * CGFloat(imageArray.count), self.frame.size.height - 30, 20 * CGFloat(imageArray.count), 20)
            self.pageIndicator.numberOfPages = self.imageArray.count
        }
    }
    
    var urlImageArray:[String]? {
        
        willSet(newValue){
            self.urlImageArray = newValue
        }
        didSet {
            for urlString in self.urlImageArray!{
                
                let urlImage = NSURL(string: urlString)
                   if urlImage == nil {
                    break
                }
                let dataImage = NSData(contentsOfURL: urlImage!)
                if dataImage == nil{
                    break
                }
                let tempImage = UIImage(data: dataImage!)
                if tempImage == nil {
                    break
                }
                imageArray.append(tempImage)
            }
        }
    }
    
    var currentImageView:  UIImageView!
    var lastImageView:     UIImageView!
    var nextImageView:     UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(frame: CGRect ,imageArray: [UIImage!]?) {
        self.init(frame : frame)
        self.imageArray = imageArray
        self.indexOfCurrentImage = 0
        
        self.setUpCircleView()
    }
    
    
    
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func setUpCircleView(){

        self.contentScrollView = UIScrollView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        contentScrollView.contentSize = CGSizeMake(self.frame.size.width * 3, 0)
        contentScrollView.delegate = self;
        contentScrollView.bounces = false
        contentScrollView.pagingEnabled = true
//        contentScrollView.backgroundColor = UIColor.greenColor()
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.scrollEnabled = !(imageArray.count == 1)
        
        self.addSubview(contentScrollView)
        
        self.currentImageView = UIImageView()
        currentImageView.frame = CGRectMake(self.frame.size.width, 0, self.frame.size.width, 200)
        currentImageView.userInteractionEnabled = true
        currentImageView.contentMode = UIViewContentMode.ScaleAspectFill
        currentImageView.clipsToBounds = true
        contentScrollView.addSubview(currentImageView)
        
        let imageTap = UITapGestureRecognizer(target: self, action: "imageTapAction:")
        currentImageView.addGestureRecognizer(imageTap)
        
    
        self.lastImageView = UIImageView()
        lastImageView.frame = CGRectMake(0, 0, self.frame.size.width, 200)
        lastImageView.contentMode = UIViewContentMode.ScaleAspectFill
        lastImageView.clipsToBounds = true
        contentScrollView.addSubview(lastImageView)
        
        self.nextImageView = UIImageView()
        nextImageView.frame = CGRectMake(self.frame.size.width * 2, 0, self.frame.size.width, 200)
        nextImageView.contentMode = UIViewContentMode.ScaleAspectFill
        nextImageView.clipsToBounds = true
        contentScrollView.addSubview(nextImageView)
        
        
        self.setScrollViewOfImage()
        
        contentScrollView.setContentOffset(CGPointMake(self.frame.size.width, 0), animated: false)
        
        //设置分页指示器
        self.pageIndicator = UIPageControl(frame: CGRectMake(self.frame.size.width - 20 * CGFloat(imageArray.count), self.frame.size.height - 30, 20 * CGFloat(imageArray.count), 20))
        pageIndicator.hidesForSinglePage = true
        pageIndicator.numberOfPages = imageArray.count
        pageIndicator.backgroundColor = UIColor.clearColor()
        self.addSubview(pageIndicator)
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(TimeInterVal, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        
        
    
    }
    
    //MARK:设置图片
    private func setScrollViewOfImage(){
        self.currentImageView.image = self.imageArray[self.indexOfCurrentImage]
        self.lastImageView.image = self.imageArray[self.getLastImageIndex(indexOfCurrentImage: self.indexOfCurrentImage)]
        self.nextImageView.image = self.imageArray[self.getNextImageIndex(indexOfCurrentImage: self.indexOfCurrentImage)]
    }
    
    
    /**
     定时器走的方法
     */
    func timerAction(){
        contentScrollView.setContentOffset(CGPointMake(self.frame.size.width * 2, 0), animated: true)
    }
    
    //MARK Delegate Methods
    //MARK UIScrollViewDelegate
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer?.invalidate()
        timer = nil
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {

        let offset = scrollView.contentOffset.x
        
        if  offset == 0{
            self.indexOfCurrentImage = self.getLastImageIndex(indexOfCurrentImage: self.indexOfCurrentImage)
            
        }else if offset == self.frame.size.width * 2 {
            self.indexOfCurrentImage = self.getNextImageIndex(indexOfCurrentImage: self.indexOfCurrentImage)
        }
        
        self.setScrollViewOfImage()
        scrollView.setContentOffset(CGPointMake(self.frame.size.width, 0), animated: false)
        
        if timer == nil {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(TimeInterVal, target: self, selector: "timerAction", userInfo: nil, repeats: true)
        
        }
    }
    
    //时间触发器 设置滑动时动画true，会触发的方法
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        self.scrollViewDidEndDecelerating(contentScrollView)
    }
    
    
    private func getLastImageIndex(indexOfCurrentImage index:Int) ->Int{
        
        let tempIndex = index - 1
        
        if tempIndex == -1{
            return self.imageArray.count - 1
        }else{
            return tempIndex
        
        }
        
    }
    
    
    
    private func getNextImageIndex(indexOfCurrentImage index:Int)->Int{
        
        let tempindex = index+1
        
        return tempindex < self.imageArray.count ? tempindex : 0
    }
    
    
    func imageTapAction(tap: UITapGestureRecognizer){
        
        print("\(indexOfCurrentImage)")
        
        self.del?.clickCurrentImage(indexOfCurrentImage)

     
    }
}







