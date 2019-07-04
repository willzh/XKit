//
//  UIColor+XUtils.m
//
//  Created by will on 13-12-10.
//
//

#import "UIColor+XUtils.h"



inline UIColor *ZS_ColorWithRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

inline UIColor *ZS_ColorWithRGB(CGFloat r, CGFloat g, CGFloat b) {
    return ZS_ColorWithRGBA(r, g, b, 1.0);
}


inline UIColor *ZS_ColorWithSameRGB(CGFloat v, CGFloat alpha) {
    CGFloat cv = v / 255.0;
    return ZS_ColorWithRGBA(cv, cv, cv, alpha);
}



#pragma mark - Hex
inline UIColor *ZS_ColorWithHexRGBA(NSInteger hexRGBA) {
    return [UIColor colorWithRed:((hexRGBA & 0xFF000000) >> 24) / 255.0f
                           green:((hexRGBA & 0xFF0000) >> 16) / 255.0f
                            blue:((hexRGBA & 0xFF00) >> 8) / 255.0f
                           alpha:(hexRGBA & 0xFF) / 255.0f];
}

inline UIColor *ZS_ColorWithHexRGB(NSInteger hexRGB, CGFloat alpha) {
    return [UIColor colorWithRed:(((hexRGB & 0xFF0000) >> 16) / 255.0)
                           green:(((hexRGB & 0xFF00) >> 8) / 255.0)
                            blue:((hexRGB & 0xFF) / 255.0)
                           alpha:alpha];
}

inline UIColor *ZS_ColorWithHex(NSInteger hexRGB) {
    return [UIColor colorWithRed:(((hexRGB & 0xFF0000) >> 16) / 255.0)
                           green:(((hexRGB & 0xFF00) >> 8) / 255.0)
                            blue:((hexRGB & 0xFF) / 255.0)
                           alpha:1.0];
}



@implementation UIColor (XUtils)


@end
