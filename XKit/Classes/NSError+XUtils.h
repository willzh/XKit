//
//  NSError+XUtils.h
//  RDLoveEditor
//
//  Created by Will on 2019/5/6.
//  Copyright © 2019 LE. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSError (XUtils)

/// 构造 error 
+ (instancetype)errorWithDomain:(NSErrorDomain)domain
                           code:(NSInteger)code
           localizedDescription:(NSString *)localDesc;


@end

NS_ASSUME_NONNULL_END
