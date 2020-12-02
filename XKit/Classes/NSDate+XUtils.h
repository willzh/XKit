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

/// 从字符串获得日期
+ (NSDate *)zs_dateFromString:(NSString *)dateString fromFormat:(NSString *)fromFormat;

/// 格式化为 xx 小时，xx 天前等
+ (NSString *)zs_formatDateFromString:(NSString *)dateString fromFormat:(NSString *)dateFormat;

/// 根据指定的格式化日期
- (NSString *)zs_stringWithFormat:(NSString *)format;

/// 返回日期的年
- (NSInteger)zs_year;

/// 返回日期的年
- (NSInteger)zs_month;

/// 返回日期的年
- (NSInteger)zs_day;

/// 从日期获得格式化字符串
- (NSString *)zs_formatString:(NSString *)format;


@end

NS_ASSUME_NONNULL_END
