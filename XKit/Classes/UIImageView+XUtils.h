//
//  UIImageView+XUtils.h
//  XKit
//
//  Created by Will on 2019/7/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (XInit)


/// 从图片名初始化一个 imageView
+ (instancetype)zs_imageViewWithImageName:(NSString *)imageName;


@end

NS_ASSUME_NONNULL_END
