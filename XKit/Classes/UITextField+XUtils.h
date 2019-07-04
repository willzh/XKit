//
//  UITextField+XUtils.h
//  Pods-XKit_Example
//
//  Created by Will on 2019/7/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 限制输入最大长度
@interface UITextField (XLimit)

@property (nonatomic, assign) IBInspectable NSInteger zs_maxLength; //!< 最大输入长度

@end




@interface UITextField (XPlaceholder)

/// 设置 placeholder 字体和颜色
- (void)zs_setPlaceholderColor:(UIColor *)color font:(UIFont *)font;

@end




NS_ASSUME_NONNULL_END
