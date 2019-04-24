//
//  NSArray+YSort.m
//  YAlgorithmsDemo_OC
//
//  Created by yxw on 2019/4/24.
//  Copyright © 2019 yxw. All rights reserved.
//

#import "NSArray+YSort.h"

@implementation NSArray (YSort)


/*
 冒泡排序:
     比较相邻的元素。如果第一个比第二个大，就交换他们两个。
 
     对每一对相邻元素作同样的工作，从开始第一对到结尾的最后一对。这步做完后，最后的元素会是最大的数。
 
     针对所有的元素重复以上的步骤，除了最后一个。
 
     持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
 */
#pragma mark - 冒泡排序
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

/*
 选择排序:
     首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
 
     再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
 
     重复第二步，直到所有元素均排序完毕。
 */
#pragma mark - 选择排序
- (NSArray<NSNumber *> *)YSortSelection {
    NSMutableArray *arr = self.mutableCopy;
    NSInteger min = 0;
    for (NSInteger i = 0; i < arr.count - 1; i++) {
        min = i;
        for (NSInteger j = i+1; j < arr.count; j++) {
            if ([arr[j] compare:arr[min]] == NSOrderedAscending) {
                min = j;
            }
        }
        if (min != i) {
            NSNumber *temp = arr[i];
            arr[i] = arr[min];
            arr[min] = temp;
        }
    }
    return arr.copy;
}

@end
