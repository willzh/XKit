//
//  SZOnePixleLine.h
//  XKit_Example
//
//  Created by Will on 2019/8/5.
//  Copyright © 2019 willzh. All rights reserved.
//
//  1 像素的线条。保证在所有 iPhone 上都是 1 像素。需要使用约束
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZOnePixleLine : UIView

@property (nonatomic, assign) IBInspectable BOOL vertical; // 判断是否垂直的线，默认为 NO，表示水平线

@end

NS_ASSUME_NONNULL_END
