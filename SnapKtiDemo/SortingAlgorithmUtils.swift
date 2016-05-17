//
//  SortingAlgorithmUtils.swift
//  SnapKtiDemo
//
//  Created by apple on 16/5/17.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit

enum SortType{
    case BubbleSort //冒泡排序
    case SelectionSort //选择排序
}

class SortingAlgorithmUtils: NSObject {

    
    class func SortFromSmallToBig(var arr:[Int],SortStyle:SortType,SortEnd:(endarr:[Int])->()) {
        
        if SortStyle == SortType.BubbleSort{
    
            //走多少趟
            for var i = 0;i < arr.count - 1; ++i{
                //从后往前
                for var j = arr.count - 1;j>i;--j{
                    // 后者 < 前者 ？交换：不交换
                    if arr[j] < arr[j - 1]{
                        
                        let temp = arr[j]
                        
                        arr[j] = arr[j - 1]
                        
                        arr[j - 1] = temp
                    }
                }
            }
        }
        
        
        if SortStyle == SortType.SelectionSort{
            
            var min = 0
            
            //只需要n-1趟
            for var i = 0;i<arr.count;++i{
                min = i
                //从第n+1趟起始找到末尾
                for var j = i + 1 ; j<arr.count;++j{
                    
                    //找到比min位置更小的，就更新这一趟所找到的最小值得位置
                    if arr[j] < arr[min] {
                        
                        min = j
                    }
                }
                
                //如果min与i不相等，说明有比i位置更小的，所以需要交换
                if min != i{
                    let temp = arr[i]
                    arr [i] = arr[min]
                    arr[min] = temp
                }
            }
        }
        
        SortEnd(endarr: arr)
    }
    
    
    
}
