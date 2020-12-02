//
//  CAKeyframeAnimation+XUtilis.m
//  XKit_Example
//
//  Created by Will on 2019/8/22.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "CAKeyframeAnimation+XUtilis.h"



@implementation CAKeyframeAnimation (XUtilis)

#pragma mark - P
+ (CAKeyframeAnimation *)contentsAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    [ani setDuration:duration removeOnCompletion:NO fillMode:kCAFillModeForwards beginTime:bt values:values];
    
    return ani;
}

+ (CAKeyframeAnimation *)opacityAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    [ani setDuration:duration removeOnCompletion:NO fillMode:kCAFillModeForwards beginTime:bt values:values];
    
    return ani;
}

+ (CAKeyframeAnimation *)boundsAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    [ani setDuration:duration removeOnCompletion:NO fillMode:kCAFillModeForwards beginTime:bt values:values];
    
    return ani;
}

+ (CAKeyframeAnimation *)scaleAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt
{
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    [ani setDuration:duration removeOnCompletion:NO fillMode:kCAFillModeForwards beginTime:bt values:values];
    
    return ani;
}




#pragma mark - Private Methods
- (void)setDuration:(CFTimeInterval)d
 removeOnCompletion:(BOOL)roc
           fillMode:(CAMediaTimingFillMode)fm
          beginTime:(CFTimeInterval)bt
             values:(NSArray *)values
{
    self.duration = d;
    self.fillMode = fm;
    self.beginTime = bt;
    self.values = values;
    
}


@end
