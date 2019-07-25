//
//  SZPerson.m
//  XKit_Example
//
//  Created by Will on 2019/7/25.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "SZPerson.h"

@implementation SZPerson

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"a";
//        NSLog(@"name:%p", _name);
        
        _obj1 = [[NSObject alloc] init];
//        NSLog(@"_obj1:%p", _obj1);
        
    }
    return self;
}

@end
