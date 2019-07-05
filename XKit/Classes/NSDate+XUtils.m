//
//  NSDate+XUtils.m
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import "NSDate+XUtils.h"

@implementation NSDate (XUtils)


/// 当前毫秒数
+ (NSTimeInterval)zs_currentMilliSeconds {
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

/// 一天的秒数
+ (NSInteger)zs_secondsOfDay {
    return 86400;
}

/// 一小时的秒数
+ (NSInteger)zs_secondsOfHour {
    return 3600;
}



@end
