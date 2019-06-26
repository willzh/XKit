//
//  NSMutableArray+XUtils.m
//  RTFundProject
//
//  Created by Will on 2019/4/15.
//  Copyright © 2019年. All rights reserved.
//

#import "NSMutableArray+XUtils.h"

@implementation NSMutableArray (Utility)


- (void)zs_addObject:(nonnull id)obj
{
    BOOL exist = NO;
    for (id model in self)
    {
        if ([obj isEqual:model])
        {
            exist = YES;
            break;
        }
    }
    
    if (!exist)
    {
        [self addObject:obj];
    }
}

- (void)zs_addObjectsFromArray:(NSArray *)array
{
    for (id nm in array) {
        [self zs_addObject:nm];
    }
}







@end
