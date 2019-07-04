//
//  UIView+XUtils.h
//  RTFundProject
//
//  Created by Will on 2019/3/20.
//  Copyright © 2019年 rtfund. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XUtils)


/// 添加一个宽度约束
- (void)zs_addWidthLayout:(CGFloat)width;

/// 添加一个高度约束
- (void)zs_addHeightLayout:(CGFloat)height;


@end




@interface UIView (XLoader)


/// 从 xib 加载 view
+ (instancetype)zs_loadInstanceFromNib;

/// 从 xib 加载 view，指定 xib 文件名
+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName;

/// 从 xib 加载 view，指定 xib 文件名和 File's Owner
+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(nullable id)owner;

/// 从 xib 加载 view，指定 xib 文件名和 File's Owner，xib文件包
+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;


@end

NS_ASSUME_NONNULL_END
