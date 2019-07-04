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
+ (NSString *)zs_appDisplayName;

/// App 版本号
+ (NSString *)zs_appVersion;

/// 编译版本号
+ (NSString *)zs_buildVersion;

/// CFBundleInfoDictionaryVersion
+ (NSString *)zs_bundleInfoDictionaryVersion;

/// CFBundleExecutable
+ (NSString *)zs_bundleExecutable;

/// CFBundleIdentifier
+ (NSString *)zs_bundleIdentifier;

/// CFBundleDevelopmentRegion
+ (NSString *)zs_bundleDevelopmentRegion;

/// 获取包名称
+ (NSString *)zs_bundleName;

/// kCFBundleLocalizationsKey
+ (NSString *)zs_bundleLocalizations;


/// 控制台打印上面所有方法的返回值
+ (void)zs_logAll;




@end

