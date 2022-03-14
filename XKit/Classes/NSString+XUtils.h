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
- (CGSize)zs_sizeWithFont:(UIFont *)font inSize:(CGSize)size;

/// 根据字符串的字体和显示的最大宽度计算实际高度
- (CGFloat)zs_heightWithFont:(UIFont *)font maxWidth:(CGFloat)width;

/// 根据字符串的字体和显示的最大高度计算实际宽度
- (CGFloat)zs_widthWithFont:(UIFont *)font maxHeight:(CGFloat)height;


/// length 位小数点的格式化数字字符串
- (NSString *)zs_moneyFormatWithFractionLength:(NSInteger)length;



/// 是否空字符串，只有空格和换行也会返回 YES
- (BOOL)zs_isEmpty;

/// 判断是否为数字
- (BOOL)isNumber;


/// 转换为 bezierPath
- (UIBezierPath *)zs_bezierPathWithFont:(UIFont *)font;


/// 随机指定长度的字符串
+ (NSString *)zs_randomStringWithLength:(NSInteger)length;



/// 本地化，从 mainBundle 默认的 Localizable.strings 文件中读取
- (NSString *)zs_locallized;

/// 本地化，从 mainBundle 中，根据 table.strings 文件中读取
- (NSString *)zs_localizedInTable:(NSString *)table;

/// 本地化，从 bundle 中，根据 table.strings 文件中读取
- (NSString *)zs_localizedInTable:(NSString *)table bundle:(NSBundle *)bundle;



/// 字体图标。e652.zs_unicode == \U0000e652
- (NSString *)zs_unicode;




@end

NS_ASSUME_NONNULL_END
