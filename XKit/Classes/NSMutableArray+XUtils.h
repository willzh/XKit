//
//  NSMutableArray+XUtils.h
//  RTFundProject
//
//  Created by Will on 2019/4/15.
//  Copyright © 2019年. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (XUtils)

/// 添加元素，增加了去重功能。需要元素实现了 isEqual: 方法才行
- (void)zs_addObject:(nonnull id)obj;

/// 从数组添加元素，增加了去重功能。需要元素实现了 isEqual: 方法才行
- (void)zs_addObjectsFromArray:(NSArray *)array;


@end

NS_ASSUME_NONNULL_END
