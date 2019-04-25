//
//  NSArray+YSort.h
//  YAlgorithmsDemo_OC
//
//  Created by yxw on 2019/4/24.
//  Copyright © 2019 yxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (YSort)

/// 冒泡排序
- (NSArray<NSNumber *> *)YSortBubble;

/// 选择排序
- (NSArray<NSNumber *> *)YSortSelection;

/// 插入排序
- (NSArray<NSNumber *> *)YSortInsert;

/// 希尔排序
- (NSArray<NSNumber *> *)YSortShell;

@end

NS_ASSUME_NONNULL_END
