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

/// 将字符串从某个日期格式，转换到另外的日期格式
+ (NSString *)zs_formatDateFromString:(NSString *)dateString fromFormat:(NSString *)fromFormat toFormat:(NSString *)toFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:fromFormat];
    
    NSDate *date = [df dateFromString:dateString];
    
    [df setDateFormat:toFormat];
    return [df stringFromDate:date];
}

/// 从字符串获得日期
+ (NSDate *)zs_dateFromString:(NSString *)dateString fromFormat:(NSString *)fromFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:fromFormat];
    
    return [df dateFromString:dateString];
}

/// 格式化为 xx 小时，xx 天前等
+ (NSString *)zs_formatDateFromString:(NSString *)dateString fromFormat:(NSString *)dateFormat
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:dateFormat];
    
    NSDate *date = [df dateFromString:dateString];
    NSDate *now = [NSDate date];
    NSTimeInterval diff = [now timeIntervalSinceDate:date];
    if (diff < 60) {
        return @"刚刚";
    }else if (diff < 3600) {
        return [NSString stringWithFormat:@"%0.0f分钟前", diff / 60];
    }else if (diff < 86400) {
        return [NSString stringWithFormat:@"%0.0f小时前", diff / 3600];
    }else if (diff < 432000) { // 5 天
        return [NSString stringWithFormat:@"%0.0f天前", diff / 86400];
    }else if (now.zs_year == date.zs_year) {
        return [date zs_stringWithFormat:@"MM-dd"];
    }
    return [date zs_stringWithFormat:@"yyyy-MM-dd"];
}


/// 根据指定的格式化日期
- (NSString *)zs_stringWithFormat:(NSString *)format
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    
    return [df stringFromDate:self];
}


/// 返回日期的年
- (NSInteger)zs_year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

/// 返回日期的年
- (NSInteger)zs_month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

/// 返回日期的年
- (NSInteger)zs_day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

/// 从日期获得格式化字符串
- (NSString *)zs_formatString:(NSString *)format
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:format];
    
    return [df stringFromDate:self];
}

@end
