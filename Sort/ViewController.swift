//
//  ViewController.swift
//  Sort
//
//  Created by 李永杰 on 2020/2/18.
//  Copyright © 2020 李永杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    func numbers(count: Int) -> [Int]{
        var numbers = [Int](repeating: 0, count: count)
        for i in 0..<count {
            numbers[i] = Int(arc4random() % 100 + 1)
        }
        return numbers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var array = numbers(count: 10)
        print("原数组\(array)")
//        bubbleSort(array: &array)         // 冒泡

//        selectionSort(array: &array)      // 选择
        
        quickSort(array: &array, low: 0, high: array.count - 1)
        print("排序数组\(array)")
    }
    
    /*
    冒泡排序
    1. 首先确定需要跑n-1趟，第n-1趟完就排序成功了
    2. 两两比较，每趟需要比较n-i-1次,随着i增加，每次少比较一次
    3. 相邻的两个元素，前者大于后者就交换
    4. n-1趟，结束
    */
    func bubbleSort(array: inout[Int]) {

        for i in 0..<array.count-1 { // 需要跑n-1趟
            for j in 0..<array.count-i-1 { // 每趟比较n-(i+1)次
                if array[j] > array[j+1] {
                    array.swapAt(j, j+1) // 数组交换内置方法
                }
            }
        }
    }
    
    /*
     选择排序
    1. 将数组抽象分成两个序列，已排序序列在前，未排序序列在后
    2. 从0开始，当作已排序序列的起始位置
    3. 从未排序序列中循环，和最小元素对比，若小于最小元素，放到已排序序列的末尾
    4. n-1趟，结束
    */
    func selectionSort(array: inout[Int]) {
        
        var min = 0; // 记录最小值的下标
        for i in 0..<array.count-1 { // 需要选择n-1次
            min = i // 最小值索引，选择一次就加一，当作已排序序列的最后一个
            for j in i+1..<array.count { // 从未排序序列中选择一个最小的
                if array[j] < array[min] {
                    min = j
                }
            }
            if min != i {
                array.swapAt(i, min) // 交换
            }
        }
    }
    
    /*
     快速排序
     1. 找一个基准数
     2. 比基准数小的放到基准数左边
     3. 递归把基准数左右两边的子序列排序
     */
    
    func partitionQuick(array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[high]         // 假设最后一个元素为基准数
        var i = low // 从最小位置开始
        for j in low..<high { // 从左向右查找
            if array[j] <= pivot { // 如果array[j]小于基准数
                array.swapAt(i, j) // 小于基准数的都放到基准位的左边
                i += 1 // 确定基准位
            }
        }
        array.swapAt(i, high)   // 把基准数放到新的基准位置，保证基准数左边的都比基准数小，基准数右边的都比基准数大
        return i
    }

    func quickSort(array: inout [Int], low: Int, high: Int) {
        if low < high {
            let pivot = partitionQuick(array: &array, low: low, high: high) // 获取基准位
            quickSort(array: &array, low: low, high: pivot - 1) // 递归排序基数左边的序列
            quickSort(array: &array, low: pivot + 1, high: high) // 递归排序基数右边的序列
        }
    }
 
    // 插入排序
    func insertSort(array: [Int]) -> [Int] {
        var targetArray: [Int] = array
        for i in 0..<targetArray.count {
            var j = i
            let temp = targetArray[j]
            while j>0, temp<targetArray[j-1] {
                targetArray[j] = targetArray[j-1]
                j=j-1
            }
            targetArray[j] = temp
        }
        return targetArray
    }
}

