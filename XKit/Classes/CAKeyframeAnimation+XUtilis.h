//
//  CAKeyframeAnimation+XUtilis.h
//  XKit_Example
//
//  Created by Will on 2019/8/22.
//  Copyright © 2019 willzh. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAKeyframeAnimation (XUtilis)


+ (CAKeyframeAnimation *)contentsAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt;

+ (CAKeyframeAnimation *)opacityAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt;

+ (CAKeyframeAnimation *)boundsAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt;

+ (CAKeyframeAnimation *)scaleAnimationWithValues:(NSArray *)values duration:(CFTimeInterval)duration beginTime:(CFTimeInterval)bt;




@end

NS_ASSUME_NONNULL_END
