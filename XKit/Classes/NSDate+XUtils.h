//
//  NSDate+XUtils.h
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (XUtils)


/// 当前毫秒数
+ (NSTimeInterval)zs_currentMilliSeconds;

/// 一天的秒数
+ (NSInteger)zs_secondsOfDay;

/// 一小时的秒数
+ (NSInteger)zs_secondsOfHour;

@end

NS_ASSUME_NONNULL_END
