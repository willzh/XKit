//
//  NSObject+XUtils.h
//  XKit_Example
//
//  Created by Will on 2019/7/24.
//  Copyright © 2019 willzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSObject (XNotification)


/// 类方法，发送通知
+ (void)zs_post:(NSNotificationName)name;

/// 类方法，发送通知
+ (void)zs_post:(NSNotificationName)name object:(nullable id)obj userInfo:(nullable NSDictionary *)info;


/// 添加通知监听
- (void)zs_listen:(NSNotificationName)name selector:(SEL)sel;

/// 发送通知
- (void)zs_post:(NSNotificationName)name object:(nullable id)obj userInfo:(nullable NSDictionary *)info;

/// 发送通知
- (void)zs_post:(NSNotificationName)name;





@end



@interface NSObject (XRunTime)

/// 获取属性名
- (NSString *)zs_getPropertyName:(id)obj;

@end




@interface NSObject (XKVO)

/// 添加 kvo
- (void)zs_addKVO:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

/// 添加 kvo，默认监听新值，NSKeyValueObservingOptionNew
- (void)zs_addKVO:(NSString *)keyPath;

/// 移除 KVO
- (void)zs_removeKVO:(NSString *)keyPath;


@end






NS_ASSUME_NONNULL_END
