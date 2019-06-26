//
//  UIViewController+XUtils.m
//
//  Created by NoOrg on 2018/3/28.
//  Copyright © 2018年 All rights reserved.
//


#import "UIViewController+XUtils.h"




@implementation UIViewController (Alert)

#pragma mark -
- (void)showOneButtonAlert:(NSString *)title msg:(NSString *)msg
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)showAlert:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block
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




@implementation UIViewController (ActionSheet)

- (void)showActionSheet:(NSString *)title msg:(NSString *)msg buttons:(NSArray <NSString *> *)titles actions:(void(^)(NSString *title))block
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
















