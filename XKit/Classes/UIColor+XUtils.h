//
//  UIColor+XUtils.h
//
//  Created by will on 13-12-10.
//
//

#import <UIKit/UIKit.h>



/// 创建 UIColor。r, g, b 都自动除了 255.0, 传整数即可, 值 0 - 255 范围。 alpha 的值在 0 - 1 范围
CG_EXTERN UIColor *ColorWithRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha);

/// 创建 UIColor. r, g, b 都自动除了 255.0, 传整数即可，a 默认为 1.0
CG_EXTERN UIColor *ColorWithRGB(CGFloat r, CGFloat g, CGFloat b);


/// 创建 UIColor. r, g, b 都是相同的值，在 0 - 255 范围. alpha 的值在 0 - 1 范围
CG_EXTERN UIColor *ColorWithSameRGB(CGFloat v, CGFloat alpha);

/// 以 16 进制创建 UIColor. 0xRRGGBBAA 格式
CG_EXTERN UIColor *ColorWithHexRGBA(NSInteger hexRGBA);

/// 以 16 进制创建 UIColor. 0xRRGGBB 格式， alpha 的值在 0 - 1 范围
CG_EXTERN UIColor *ColorWithHexRGB(NSInteger hexRGB, CGFloat alpha);




@interface UIColor (XUtils)


@end

