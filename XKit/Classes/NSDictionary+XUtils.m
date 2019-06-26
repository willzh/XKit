//
//  NSDictionary+XUtils.m
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import "NSDictionary+XUtils.h"

@implementation NSDictionary (XUtils)

- (NSString *)keyValuesJoinedByString:(NSString *)joined
{
    NSArray *keys = self.allKeys;
    [keys sortedArrayUsingComparator:^NSComparisonResult(NSString *  _Nonnull obj1, NSString *  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSString *key in keys) {
        [tempArr addObject:[NSString stringWithFormat:@"%@=%@", key, self[key]]];
    }
    
    return [tempArr componentsJoinedByString:joined];
}





@end
