//
//  UIViewController+XUtils.m
//
//  Created by NoOrg on 2018/3/28.
//  Copyright © 2018年 All rights reserved.
//


#import "UIViewController+XUtils.h"




@implementation UIViewController (XAlert)

#pragma mark -
- (void)zs_showOneButtonAlert:(NSString *)title msg:(NSString *)msg
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)zs_showAlert:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    for (NSString *str in titles)
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(action.title);
            }
        }];
        [alert addAction:action];
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]]; // 取消
    [self presentViewController:alert animated:YES completion:nil];
}



@end




@implementation UIViewController (XActionSheet)

- (void)zs_showActionSheet:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (NSString *str in titles)
    {
        UIAlertAction *action = [UIAlertAction actionWithTitle:str style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (block) {
                block(action.title);
            }
        }];
        [alert addAction:action];
    }
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]]; // 取消
    [self presentViewController:alert animated:YES completion:nil];
}


@end









@implementation UIViewController (XLoader)


/// 从 storyboar 中加载。
+ (instancetype)zs_loadFromStoryboard:(NSString *)storyboardName {
    return [self zs_loadFromStoryboard:storyboardName identifier:NSStringFromClass([self class])];
}

/// 从 storyboar 中加载, 指定 viewController 的 identifier。
+ (instancetype)zs_loadFromStoryboard:(NSString *)storyboardName identifier:(NSString *)vcid
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [sb instantiateViewControllerWithIdentifier:vcid];
}


/// 从 xib 加载。
+ (instancetype)zs_loadFromXib {
    return [[self alloc] initWithNibName:NSStringFromClass([self class]) bundle:nil];
}




@end



