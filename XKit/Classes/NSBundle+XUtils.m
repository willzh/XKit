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
+ (NSString *)zs_appDisplayName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

/// App 版本号
+ (NSString *)zs_appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

/// 编译版本号
+ (NSString *)zs_buildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
}

/// CFBundleInfoDictionaryVersion
+ (NSString *)zs_bundleInfoDictionaryVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleInfoDictionaryVersionKey];
}

/// CFBundleExecutable
+ (NSString *)zs_bundleExecutable {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleExecutableKey];
}

/// CFBundleIdentifier
+ (NSString *)zs_bundleIdentifier {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleIdentifierKey];
}

/// CFBundleDevelopmentRegion
+ (NSString *)zs_bundleDevelopmentRegion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleDevelopmentRegionKey];
}

/// 获取包名称
+ (NSString *)zs_bundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
}

/// kCFBundleLocalizationsKey
+ (NSString *)zs_bundleLocalizations {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleLocalizationsKey];
}


+ (void)zs_logAll
{
    NSLog(@"appDisplayName:%@", [self zs_appDisplayName]);
    NSLog(@"appVersion:%@", [self zs_appVersion]);
    NSLog(@"buildVersion:%@", [self zs_buildVersion]);
    NSLog(@"appDisplayName:%@", [self zs_appDisplayName]);
    NSLog(@"bundleInfoDictionaryVersion:%@", [self zs_bundleInfoDictionaryVersion]);
    NSLog(@"bundleExecutable:%@", [self zs_bundleExecutable]);
    NSLog(@"bundleIdentifier:%@", [self zs_bundleIdentifier]);
    NSLog(@"bundleDevelopmentRegion:%@", [self zs_bundleDevelopmentRegion]);
    NSLog(@"bundleName:%@", [self zs_bundleName]);
    NSLog(@"bundleLocalizations:%@", [self zs_bundleLocalizations]);
    
}




@end
