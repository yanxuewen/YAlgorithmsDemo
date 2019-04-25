//
//  NSArray+YSort.m
//  YAlgorithmsDemo_OC
//
//  Created by yxw on 2019/4/24.
//  Copyright © 2019 yxw. All rights reserved.
//

#import "NSArray+YSort.h"

@implementation NSArray (YSort)

#pragma mark - 冒泡排序
/*
 冒泡排序:
 比较相邻的元素。如果第一个比第二个大，就交换他们两个。
 
 对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
 
 针对所有的元素重复以上的步骤，除了最后一个。
 
 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 */
- (NSArray<NSNumber *> *)YSortBubble {
    NSMutableArray *arr = self.mutableCopy;
    bool flag = true;       // 设定一个标记，若为true，则表示此次循环没有进行交换，也就是待排序列已经有序，排序已经完成。
    for (NSInteger i = 1; i < arr.count; i++) {
        for (NSInteger j = 0; j < arr.count - i; j++) {
            if ([arr[j] compare:arr[j + 1]] == NSOrderedDescending) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                flag = false;
            }
        }
        if (flag) {
            break;
        }
    }
    return arr.copy;
}


#pragma mark - 选择排序
/*
 选择排序:
 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
 
 再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
 
 重复第二步，直到所有元素均排序完毕。
 */
- (NSArray<NSNumber *> *)YSortSelection {
    NSMutableArray *arr = self.mutableCopy;
    NSInteger min = 0;
    NSNumber *temp = nil;
    for (NSInteger i = 0; i < arr.count - 1; i++) {
        min = i;
        for (NSInteger j = i+1; j < arr.count; j++) {
            if ([arr[j] compare:arr[min]] == NSOrderedAscending) {
                min = j;
            }
        }
        if (min != i) {
            temp = arr[i];
            arr[i] = arr[min];
            arr[min] = temp;
        }
    }
    return arr.copy;
}

#pragma mark - 插入排序
/*
 插入排序:
 将待排序序列的第一个元素看做一个有序序列，把第二个元素到最后一个元素当成是未排序序列。
 
 从头到尾依次扫描未排序序列，将扫描到的每个元素插入有序序列的适当位置。（如果待插入的元素与有序序列中的某个元素相等，则将待插入元素插入到相等元素的后面。）
 */
- (NSArray<NSNumber *> *)YSortInsert {
    NSMutableArray *arr = self.mutableCopy;
    NSNumber *temp = nil;
    NSInteger j = 0;
    for (NSInteger i = 1; i < arr.count; i++) {
        temp = arr[i];
        j = i;
        while (j > 0 && [temp compare:arr[j-1]] == NSOrderedAscending) {
            arr[j] = arr[j-1];
            j--;
        }
        if (j != i) {
            arr[j] = temp;
        }
    }
    return arr.copy;
}

#pragma mark - 希尔排序
/*
 希尔排序:
 先取一个小于n的整数d1作为第一个增量，把文件的全部记录分组。所有距离为d1的倍数的记录放在同一个组中。
 
 先在各组内进行直接插入排序；然后，取第二个增量d2<d1重复上述的分组和排序，
 
 直至所取的增量  =1(  <  …<d2<d1)，即所有记录放在同一组中进行直接插入排序为止。
 */
- (NSArray<NSNumber *> *)YSortShell {
    NSMutableArray *arr = self.mutableCopy;
    NSInteger step = arr.count / 2;
    NSNumber *temp = nil;
    NSInteger j = 0;
    while (step > 0) {
        for (NSInteger i = step; i < arr.count; i ++) {
            temp = arr[i];
            j = i;
            while (j > i%step && [temp compare:arr[j-step]] == NSOrderedAscending) {
                arr[j] = arr[j-step];
                j -= step;
            }
            if (j != i) {
                arr[j] = temp;
            }
        }
        step /= 2;
    }
    return arr.copy;
}

@end
