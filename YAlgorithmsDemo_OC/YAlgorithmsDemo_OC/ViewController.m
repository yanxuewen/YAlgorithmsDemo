//
//  ViewController.m
//  YAlgorithmsDemo_OC
//
//  Created by yxw on 2019/4/22.
//  Copyright © 2019 yxw. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+YSort.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSInteger num = [self climbingStairsFun:4];
    NSLog(@"climbingStairsFun num:%zi",num);
    
    num = [self climbingStairsFun:5];
    NSLog(@"climbingStairsFun num:%zi",num);
    
    num = [self climbingStairsFun_Dynamic:4];
    NSLog(@"climbingStairsFun_Dynamic num:%zi",num);
    
    num = [self climbingStairsFun_Dynamic:5];
    NSLog(@"climbingStairsFun_Dynamic num:%zi",num);
    
    
    NSInteger len = [self lengthOfLongestSubstring:@"abcaacdawaa"];
    NSLog(@"lengthOfLongestSubstring len:%zi",len);
    len = [self lengthOfLongestSubstring:@"abcabbacab"];
    NSLog(@"lengthOfLongestSubstring len:%zi",len);
    
    
    [self soatArray];
}

#pragma mark - 排序
- (void)soatArray {
    NSArray *arr = @[@3,@5,@7,@1,@9,@11];
    NSArray *sortArr = [arr YSortBubble];
    NSLog(@"YSortBubble sortArr:%@",sortArr);
    
    sortArr = [arr YSortSelection];
    NSLog(@"YSortSelection sortArr:%@",sortArr);
}

#pragma mark - 爬台阶问题-递归
- (NSInteger)climbingStairsFun:(NSInteger)n {
    /*
     Q:一个人爬楼梯，每次只能爬1个或2个台阶，假设有n个台阶，那么这个人有多少种不同的爬楼梯方法？
     A:在这里，可以思考一下：可以根据第一步的走法把所有走法分为两类：
     
     ① 第一类是第一步走了 1 个台阶
     
     ② 第二类是第一步走了 2 个台阶
     
     所以 n 个台阶的走法就等于先走 1 阶后，n-1 个台阶的走法 ，然后加上先走 2 阶后，n-2 个台阶的走法。
     
     用公式表示就是：
     
     f(n) = f(n-1)+f(n-2)
     */
    if (n == 1) return 1;
    if (n == 2) return 2;
    return [self climbingStairsFun:n-1] + [self climbingStairsFun:n-2];
}

#pragma mark - 爬台阶问题-动态规划
- (NSInteger)climbingStairsFun_Dynamic:(NSInteger)n {
    if (n <= 3) {
        return n;
    }
    
    NSInteger n_2 = 1;
    NSInteger n_1 = 2;
    NSInteger temp = 0;
    for (NSInteger i = 3; i <= n; i++) {
        temp = n_1 + n_2;
        n_2 = n_1;
        n_1 = temp;
    }
    return temp;
}

#pragma mark - 不重复最长子串
- (NSInteger)lengthOfLongestSubstring:(NSString *)str {
    /*
     Q:给定一个字符串，找出不含有重复字符的最长子串的长度
     A: 整个循环从 l == 0; r == -1 这个空窗口开始
        到l == s.length; r == s.length-1 这个空窗口截止
        freq[] 记录每个字符出现的次数
        在每次循环里逐渐改变窗口, 维护freq, 并记录当前窗口中的最大值
     */
    char freq[128] = {0};
    int l = 0, r = -1; //滑动窗口为s[l...r]
    int res = 0;
    
    const char *s = [str cStringUsingEncoding:NSASCIIStringEncoding];
    
    NSInteger len = str.length;
    while (l < len) {
        if (r + 1 < len && freq[s[r+1]] == 0){
            r++;
            freq[s[r]]++;
        } else {
            freq[s[l]]--;
            l++;
        }
        res = MAX(res, r-l+1);
    }
    return res;
}

@end
