//
//  UIDevice+XUtils.m
//  QuickScan
//
//  Created by  on 14-6-23.
//
//

#import "UIDevice+XUtils.h"

@implementation UIDevice (XUtils)



+ (BOOL)zs_isIPad {
    return [self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad;
}

+ (BOOL)zs_isIPhone {
    return [self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

+ (BOOL)zs_iPhoneXSeries {
    return CGRectGetHeight([UIScreen mainScreen].bounds) >= 812;
}

+ (CGFloat)zs_heightOfStatusBar {
    return [self zs_iPhoneXSeries] ? 44.0 : 20.0;
}

+ (CGFloat)zs_heightOfStatusBarAndNavigationBar {
    return [self zs_iPhoneXSeries] ? 88.0 : 64.0;
}

+ (CGFloat)zs_heightOfToolBar {
    return [self zs_iPhoneXSeries] ? 78.0 : 44.0;
}

+ (CGFloat)zs_heightOfTabBar {
    return [self zs_iPhoneXSeries] ? 83.0 : 49.0;
}

+ (CGFloat)zs_safeAreaOfTop {
    return [self zs_iPhoneXSeries] ? 24.0 : 0.0;
}

+ (CGFloat)zs_safeAreaOfBottom {
    return [self zs_iPhoneXSeries] ? 34.0 : 0.0;
}

+ (CGSize)zs_screenSize {
    return [UIScreen mainScreen].bounds.size;
}

+ (CGFloat)zs_screenHeight {
    return CGRectGetHeight([UIScreen mainScreen].bounds);
}

+ (CGFloat)zs_screenWidth {
    return CGRectGetWidth([UIScreen mainScreen].bounds);
}




@end
