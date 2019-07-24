//
//  NSObject+XUtils.h
//  XKit_Example
//
//  Created by Will on 2019/7/24.
//  Copyright © 2019 willzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSObject (Notification)

/// 添加通知监听
- (void)zs_listen:(NSNotificationName)name selector:(SEL)sel;

/// 发送通知
- (void)zs_post:(NSNotificationName)name object:(id)obj userInfo:(NSDictionary *)info;

/// 发送通知
- (void)zs_post:(NSNotificationName)name;


@end

NS_ASSUME_NONNULL_END
