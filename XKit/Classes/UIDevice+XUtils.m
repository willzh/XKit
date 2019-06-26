//
//  UIDevice+XUtils.m
//  QuickScan
//
//  Created by  on 14-6-23.
//
//

#import "UIDevice+XUtils.h"

@implementation UIDevice (XUtils)



+ (BOOL)zs_isIPad
{
    if ([self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)zs_isIPhone
{
    if ([self currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        return YES;
    }
    
    return NO;
}


+ (BOOL)zs_iPhoneXSeries
{
    CGFloat sh = CGRectGetHeight([UIScreen mainScreen].bounds);
    //return (sh == 812 || sh == 896);
    return sh >= 812;
}

+ (CGFloat)zs_heightOfStatusBar
{
    return [self zs_iPhoneXSeries] ? 44.0 : 20.0;
}

+ (CGFloat)zs_heightOfStatusBarAndNavigationBar
{
    return [self zs_iPhoneXSeries] ? 88.0 : 64.0;
}

+ (CGFloat)zs_safeAreaOfTop
{
    return [self zs_iPhoneXSeries] ? 24.0 : 0.0;
}

+ (CGFloat)zs_safeAreaOfBottom
{
    return [self zs_iPhoneXSeries] ? 34.0 : 0.0;
}







@end
