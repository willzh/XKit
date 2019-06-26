//
//  NSBundle+XUtils.m
//  RDLoveEditor
//
//  Created by Will on 2019/5/6.
//  Copyright © 2019 LE. All rights reserved.
//

#import "NSBundle+XUtils.h"

@implementation NSBundle (XUtils)


/// 显示的名称
+ (NSString *)appDisplayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

/// App 版本号
+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

/// 编译版本号
+ (NSString *)buildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

/// CFBundleInfoDictionaryVersion
+ (NSString *)bundleInfoDictionaryVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleInfoDictionaryVersionKey];
}

/// CFBundleExecutable
+ (NSString *)bundleExecutable {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleExecutableKey];
}

/// CFBundleIdentifier
+ (NSString *)bundleIdentifier {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
}

/// CFBundleDevelopmentRegion
+ (NSString *)bundleDevelopmentRegion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleDevelopmentRegionKey];
}

/// 获取包名称
+ (NSString *)bundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
}

/// kCFBundleLocalizationsKey
+ (NSString *)bundleLocalizations {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleLocalizationsKey];
}


+ (void)logAll
{
    NSLog(@"appDisplayName:%@", [self appDisplayName]);
    NSLog(@"appVersion:%@", [self appVersion]);
    NSLog(@"buildVersion:%@", [self buildVersion]);
    NSLog(@"appDisplayName:%@", [self appDisplayName]);
    NSLog(@"bundleInfoDictionaryVersion:%@", [self bundleInfoDictionaryVersion]);
    NSLog(@"bundleExecutable:%@", [self bundleExecutable]);
    NSLog(@"bundleIdentifier:%@", [self bundleIdentifier]);
    NSLog(@"bundleDevelopmentRegion:%@", [self bundleDevelopmentRegion]);
    NSLog(@"bundleName:%@", [self bundleName]);
    NSLog(@"bundleLocalizations:%@", [self bundleLocalizations]);
    
}




@end
