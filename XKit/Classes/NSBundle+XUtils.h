//
//  NSBundle+XUtils.h
//  RDLoveEditor
//
//  Created by Will on 2019/5/6.
//  Copyright © 2019 LE. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSBundle (XUtils)


/// 显示的名称
+ (NSString *)appDisplayName;

/// App 版本号
+ (NSString *)appVersion;

/// 编译版本号
+ (NSString *)buildVersion;

/// CFBundleInfoDictionaryVersion
+ (NSString *)bundleInfoDictionaryVersion;

/// CFBundleExecutable
+ (NSString *)bundleExecutable;

/// CFBundleIdentifier
+ (NSString *)bundleIdentifier;

/// CFBundleDevelopmentRegion
+ (NSString *)bundleDevelopmentRegion;

/// 获取包名称
+ (NSString *)bundleName;

/// kCFBundleLocalizationsKey
+ (NSString *)bundleLocalizations;


/// 控制台打印上面所有方法的返回值
+ (void)logAll;




@end

