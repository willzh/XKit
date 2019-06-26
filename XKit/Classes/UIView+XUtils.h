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
- (void)addWidthLayout:(CGFloat)width;

/// 添加一个高度约束
- (void)addHeightLayout:(CGFloat)height;


@end

NS_ASSUME_NONNULL_END
