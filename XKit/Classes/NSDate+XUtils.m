//
//  NSDate+XUtils.m
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import "NSDate+XUtils.h"

@implementation NSDate (XUtils)


/// 当前毫秒数
+ (NSTimeInterval)currentMilliSeconds {
    return [[NSDate date] timeIntervalSince1970] * 1000;
}





@end
