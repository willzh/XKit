//
//  NSDictionary+XUtils.h
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (XUtils)


/// 拼接字典。例如: k1=v1&k2=v2&k3=v3
- (NSString *)keyValuesJoinedByString:(NSString *)joined;


@end

NS_ASSUME_NONNULL_END
