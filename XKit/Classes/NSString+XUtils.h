//
//  NSString+XUtils.h
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface NSString (XUtils)

/// 根据字符串的字体和 size 计算字符串实际 size
- (CGSize)sizeWithFont:(UIFont *)font inSize:(CGSize)size;

/// 根据字符串的字体和显示的最大宽度计算实际高度
- (CGFloat)heightWithFont:(UIFont *)font maxWidth:(CGFloat)width;

/// 根据字符串的字体和显示的最大高度计算实际宽度
- (CGFloat)widthWithFont:(UIFont *)font maxHeight:(CGFloat)height;


/// length 位小数点的格式化数字字符串
- (NSString *)moneyFormatWithFractionLength:(NSInteger)length;



/// 是否空字符串，只有空格和换行也会返回 YES
- (BOOL)isEmpty;



/// 转换为 bezierPath
- (UIBezierPath *)bezierPathWithFont:(UIFont *)font;





@end

NS_ASSUME_NONNULL_END
