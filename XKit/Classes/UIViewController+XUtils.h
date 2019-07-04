//
//  UIViewController+XUtils.h
//
//  Created by NoOrg on 2018/3/28.
//  Copyright © 2018年. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (XAlert)

/// 显示一个 ‘确认’ 按钮的 alert，没有事件
- (void)zs_showOneButtonAlert:(NSString *)title msg:(NSString *)msg;

/// 显示一个 alert，根据返回的 title 来判断事件
- (void)zs_showAlert:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block;

@end



@interface UIViewController (XActionSheet)

 /**
  *@desc 显示 ActionSheet
  *@param title 标题
  *@param msg   提示信息
  *@param titles 按钮标题
  *@param block 回调，根据返回的 title 来判断事件
  */
- (void)zs_showActionSheet:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block;

@end




@interface UIViewController (XLoader)

/// 从 storyboar 中加载。
+ (instancetype)zs_loadFromStoryboard:(NSString *)storyboardName;

/// 从 storyboar 中加载, 指定 viewController 的 identifier。
+ (instancetype)zs_loadFromStoryboard:(NSString *)storyboardName identifier:(NSString *)vcid;

/// 从 xib 加载。
+ (instancetype)zs_loadFromXib;



@end
