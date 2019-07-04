//
//  UIView+XUtils.m
//
//  Created by Will on 2019/3/20.
//  Copyright © 2019年. All rights reserved.
//

#import "UIView+XUtils.h"

@implementation UIView (XUtils)


- (void)zs_addWidthLayout:(CGFloat)width
{
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1
                                                               constant:width];
    
    [self addConstraint:layout];
}

- (void)zs_addHeightLayout:(CGFloat)height
{
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1
                                                               constant:height];
    
    [self addConstraint:layout];
}





@end




@implementation UIView (XLoader)


+ (instancetype)zs_loadInstanceFromNib
{
    return [self zs_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self zs_loadInstanceFromNibWithName:nibName owner:nil];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self zs_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}


@end
