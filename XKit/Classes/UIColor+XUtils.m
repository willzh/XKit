//
//  UIColor+XUtils.m
//
//  Created by will on 13-12-10.
//
//

#import "UIColor+XUtils.h"


@implementation UIColor (XUtils)


inline UIColor *ColorWithRGBA(CGFloat r, CGFloat g, CGFloat b, CGFloat alpha) {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alpha];
}

inline UIColor *ColorWithRGB(CGFloat r, CGFloat g, CGFloat b) {
    return ColorWithRGBA(r, g, b, 1.0);
}


inline UIColor *ColorWithSameRGB(CGFloat v, CGFloat alpha) {
    CGFloat cv = v / 255.0;
    return ColorWithRGBA(cv, cv, cv, alpha);
}



#pragma mark - Hex
inline UIColor *ColorWithHexRGBA(NSInteger hexRGBA) {
    return [UIColor colorWithRed:((hexRGBA & 0xFF000000) >> 24) / 255.0f
                           green:((hexRGBA & 0xFF0000) >> 16) / 255.0f
                            blue:((hexRGBA & 0xFF00) >> 8) / 255.0f
                           alpha:(hexRGBA & 0xFF) / 255.0f];
}


inline UIColor *ColorWithHexRGB(NSInteger hexRGB, CGFloat alpha) {
    return [UIColor colorWithRed:(((hexRGB & 0xFF0000) >> 16) / 255.0)
                           green:(((hexRGB & 0xFF00) >> 8) / 255.0)
                            blue:((hexRGB & 0xFF) / 255.0)
                           alpha:alpha];
}






@end
