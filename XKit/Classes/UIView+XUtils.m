//
//  UIView+XUtils.m
//
//  Created by Will on 2019/3/20.
//  Copyright © 2019年. All rights reserved.
//

#import "UIView+XUtils.h"

@implementation UIView (XUtils)


- (void)addWidthLayout:(CGFloat)width
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

- (void)addHeightLayout:(CGFloat)height
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
