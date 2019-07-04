//
//  UIImageView+XUtils.m
//  XKit
//
//  Created by Will on 2019/7/4.
//

#import "UIImageView+XUtils.h"

@implementation UIImageView (XInit)

+ (instancetype)zs_imageViewWithImageName:(NSString *)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}





@end
