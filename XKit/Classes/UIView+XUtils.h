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

/// 添加圆角
- (void)zs_addCornerRadius:(CGFloat)radius;

/// 添加边框
- (void)zs_addBorder:(CGFloat)width color:(UIColor *)color;

/// 添加边框和圆角
- (void)zs_addBorder:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)radius;


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




@interface UIView (XAction)

/// 给 view 添加一个单击事件
- (UITapGestureRecognizer *)zs_addTapGesture:(void(^)(void))block;

/// 添加点击事件。numberOfTaps = 点击次数。otherGesture = 需要避免冲突的其他手势。block = 点击成功回调
- (UITapGestureRecognizer *)zs_addTapGestureWithTaps:(NSUInteger)numberOfTaps
                      requireGestureRecognizerToFail:(nullable UIGestureRecognizer *)otherGesture
                                           tapAction:(void(^)(void))block;


@end



NS_ASSUME_NONNULL_END
