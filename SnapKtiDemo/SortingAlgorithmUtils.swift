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
    case insertSort //直接插入排序
}

class SortingAlgorithmUtils: NSObject {
    
    /**
     - parameter array:     将要排序的数组【对象】
     - parameter Sort:      对象中的某个属性
     - parameter SortStyle: 排序方式
     - parameter SortEnd:   完成排序输出数组
     */
    class func sortFromSmallToBig(array:NSMutableArray,Sort : String,SortStyle:SortType,SortEnd:(endarr:NSMutableArray)->()) {
    
        if SortStyle == SortType.BubbleSort{
            //走多少趟
            for var i = 0;i < array.count - 1; ++i{
                //从后往前
                for var j = array.count - 1;j>i;--j{
                    
                    let modelj = array.objectAtIndex(j)
                    let modelj_1 = array.objectAtIndex(j - 1)
                    
                    let name = self.getValueByKey(modelj, key: Sort) as! String
                    let name1 = self.getValueByKey(modelj_1, key: Sort) as! String
                    
                    if name.compare(name1 as String, options: NSStringCompareOptions.CaseInsensitiveSearch) == NSComparisonResult.OrderedAscending{
                        
                        array .exchangeObjectAtIndex(j, withObjectAtIndex: j - 1)
                    }
                }
            }
        }
        if SortStyle == SortType.SelectionSort{
            
            var min = 0
            // 只需要n-1趟
            for var i = 0;i < array.count - 1; ++i{

                min = i
                // 从第n+1趟起始找到末尾
                for var j = i + 1;j < array.count ;++j{
                    
                    let modelj = array.objectAtIndex(j)
                    let modelj_1 = array.objectAtIndex(min)
                    
                    let name = self.getValueByKey(modelj, key: Sort) as! String
                    let name1 = self.getValueByKey(modelj_1, key: Sort) as! String
                    
                    // 找到比min位置更小的，就更新这一趟所找到的最小值的位置
                    if name.compare(name1 as String, options: NSStringCompareOptions.CaseInsensitiveSearch) == NSComparisonResult.OrderedAscending{
                        
                        min = j
                    }
                }
                // 如果min与i不相等，说明有比i位置更小的，所以需要交换
                if min != i {
                    array.exchangeObjectAtIndex(min, withObjectAtIndex: i)
                
                }
            }
        }
        
        SortEnd(endarr: array)
    }

// 通过属性名字符串获取对应的值
   class func getValueByKey(obj:AnyObject,key : String) -> Any{
        //
        let hMirror = Mirror(reflecting: obj)
        
        for case let (label?, value) in hMirror.children{
            
            if label == key {
                return value
            }
        }
        return NSNull()
    }
    
    
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
        
        if SortStyle == SortType.insertSort{
            for var i = 1; i < arr.count; ++i {
                if arr[i] < arr[i - 1]{
                    
                    let temp = arr[i]
                    
                    var j = i
                    while j>0 && arr[j - 1] > temp{
                        
                        arr[j] = arr[j - 1]
                        
                        j--
                    }
                    arr[j] = temp
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

func == (lhs : Person , rhs : Person) ->Bool{
    
    if lhs.age == rhs.age {
        
        return true
    }
    
    return false
    
    
}
