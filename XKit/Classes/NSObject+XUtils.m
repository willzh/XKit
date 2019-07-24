//
//  NSObject+XUtils.m
//  XKit_Example
//
//  Created by Will on 2019/7/24.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "NSObject+XUtils.h"


@implementation NSObject (Notification)

/// 添加通知监听
- (void)zs_listen:(NSNotificationName)name selector:(SEL)sel {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:nil];
}

/// 发送通知
- (void)zs_post:(NSNotificationName)name object:(id)obj userInfo:(NSDictionary *)info {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info];
}

/// 发送通知
- (void)zs_post:(NSNotificationName)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:nil];
}



@end
