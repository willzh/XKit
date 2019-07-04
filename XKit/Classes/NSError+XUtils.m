//
//  NSError+XUtils.m
//  RDLoveEditor
//
//  Created by Will on 2019/5/6.
//  Copyright © 2019 LE. All rights reserved.
//

#import "NSError+XUtils.h"

@implementation NSError (XUtils)


+ (instancetype)zs_errorWithDomain:(NSErrorDomain)domain code:(NSInteger)code localizedDescription:(NSString *)localDesc
{
    return [self errorWithDomain:domain code:code userInfo:@{NSLocalizedDescriptionKey: localDesc}];
}



@end
