//
//  UINavigationController+XUtils.m
//  XKit_Example
//
//  Created by Will on 2019/7/30.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "UINavigationController+XUtils.h"

@implementation UINavigationController (XUtils)


/// 设置导航的标题颜色
- (void)zs_setTitleColor:(UIColor *)tColor font:(UIFont *)font {
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: tColor, NSFontAttributeName: font}];
}






@end
