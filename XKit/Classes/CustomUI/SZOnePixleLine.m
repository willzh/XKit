//
//  SZOnePixleLine.m
//  XKit_Example
//
//  Created by Will on 2019/8/5.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "SZOnePixleLine.h"


@implementation SZOnePixleLine


#pragma mark -
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    for (NSLayoutConstraint *layCst in self.constraints)
    {
        if ([self makeLineConstraint:layCst vertically:_vertical]) {
            break;
        }
    }
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectZero];
    if (self)
    {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        for (NSLayoutConstraint *layCst in self.constraints)
        {
            if ([self makeLineConstraint:layCst vertically:_vertical]) {
                break;
            }
        }
    }
    return self;
}

- (void)setVertical:(BOOL)vertical
{
    _vertical = vertical;
    
    for (NSLayoutConstraint *layCst in self.constraints)
    {
        if ([self makeLineConstraint:layCst vertically:_vertical]) {
            break;
        }
    }
}

- (BOOL)makeLineConstraint:(NSLayoutConstraint *)constraint vertically:(BOOL)isVer
{
    if (isVer)
    {
        if (constraint.firstAttribute == NSLayoutAttributeWidth)
        {
            constraint.constant = 1 / [[UIScreen mainScreen] scale];
            return YES;
        }
    }else
    {
        if (constraint.firstAttribute == NSLayoutAttributeHeight)
        {
            constraint.constant = 1 / [[UIScreen mainScreen] scale];
            return YES;
        }
    }
    
    return NO;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (NSLayoutConstraint *layCst in self.constraints)
    {
        if ([self makeLineConstraint:layCst vertically:_vertical]) {
            break;
        }
    }
}




@end
