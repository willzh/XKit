//
//  UIDevice+XUtils.h
//  QuickScan
//
//  Created by  on 14-6-23.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (XUtils)

/// 判断是否 iPad
+ (BOOL)zs_isIPad;

/// 判断是否 iPhone
+ (BOOL)zs_isIPhone;


/// 判断是否 iPhone X 系列手机。iPhone X, XS, XS Max, XR 都返回 YES，其他返回 NO
+ (BOOL)zs_iPhoneXSeries;

/// 状态栏高度
+ (CGFloat)zs_heightOfStatusBar;

/// 状态栏和导航栏总高度
+ (CGFloat)zs_heightOfStatusBarAndNavigationBar;

/// toolbar 高度
+ (CGFloat)zs_heightOfToolBar;

/// tabbar 高度
+ (CGFloat)zs_heightOfTabBar;

/// 顶部安全区域高度
+ (CGFloat)zs_safeAreaOfTop;

/// 底部安全区域高度
+ (CGFloat)zs_safeAreaOfBottom;

/// 屏幕 size
+ (CGSize)zs_screenSize;

/// 屏幕高度
+ (CGFloat)zs_screenHeight;

/// 屏幕宽度
+ (CGFloat)zs_screenWidth;



@end
