//
//  NSObject+XUtils.m
//  XKit_Example
//
//  Created by Will on 2019/7/24.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "NSObject+XUtils.h"
#import <objc/runtime.h>


@implementation NSObject (XNotification)

/// 类方法，发送通知
+ (void)zs_post:(NSNotificationName)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:nil];
}

/// 类方法，发送通知
+ (void)zs_post:(NSNotificationName)name object:(nullable id)obj userInfo:(nullable NSDictionary *)info {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info];
}

/// 添加通知监听
- (void)zs_listen:(NSNotificationName)name selector:(SEL)sel {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:sel name:name object:nil];
}

/// 发送通知
- (void)zs_post:(NSNotificationName)name object:(nullable id)obj userInfo:(nullable NSDictionary *)info {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj userInfo:info];
}

/// 发送通知
- (void)zs_post:(NSNotificationName)name {
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil userInfo:nil];
}

/// 移除所有通知监听
- (void)zs_removeAllNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end





@implementation NSObject (XRunTime)


/// 获取属性名
- (NSString *)zs_getPropertyName:(id)obj
{
    NSString *rs = nil;
    
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++)
    {
        objc_property_t p = properties[i];
        NSString *pname  = [NSString stringWithUTF8String:property_getName(p)];
//        NSLog(@"property name:%@, address:%p, value:%@", pname, p, [self valueForKey:pname]);
        
        if (obj == [self valueForKey:pname])
        {
            rs = pname;
            break;
        }
//        if ([[NSString stringWithFormat:@"%p", obj] isEqualToString:[NSString stringWithFormat:@"%p", [self valueForKey:pname]]])
//        {
//            rs = pname;
//            break;
//        }
    }
    free(properties);
    
    return rs;
}


@end



@implementation NSObject (XKVO)


/// 添加 kvo
- (void)zs_addKVO:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context {
    [self addObserver:self forKeyPath:keyPath options:options context:context];
}

/// 添加 kvo，默认监听新值，NSKeyValueObservingOptionNew
- (void)zs_addKVO:(NSString *)keyPath {
    [self zs_addKVO:keyPath options:NSKeyValueObservingOptionNew context:NULL];
}

/// 移除 KVO
- (void)zs_removeKVO:(NSString *)keyPath {
    [self removeObserver:self forKeyPath:keyPath];
}



/// 使用属性添加 kvo。 [self zs_addKVOWithProperty:self.prop];
- (void)zs_addKVOWithProperty:(id)obj {
    [self zs_addKVO:[self zs_getPropertyName:obj]];
}

/// 移除 KVO
- (void)zs_removeKVOWithProperty:(id)obj {
    [self removeObserver:self forKeyPath:[self zs_getPropertyName:obj]];
}


/// 批量添加 kvo
- (void)zs_addKVO:(NSArray <NSString *> *)keyPaths observer:(id)obs
{
    for (NSString *p in keyPaths) {
        [self addObserver:obs forKeyPath:p options:NSKeyValueObservingOptionNew context:NULL];
    }
}

/// 批量移除 kvo
- (void)zs_removeKVOs:(NSArray <NSString *> *)keyPaths
{
    for (NSString *p in keyPaths) {
        [self removeObserver:self forKeyPath:p];
    }
}






@end
