//
//  UIView+XUtils.m
//
//  Created by Will on 2019/3/20.
//  Copyright © 2019年. All rights reserved.
//

#import "UIView+XUtils.h"
#import <objc/runtime.h>



inline CGSize ZS_CGSizeScale(CGSize size, CGFloat scale) {
    return CGSizeMake(size.width * scale, size.height * scale);
}




@implementation UIView (XUtils)


- (void)zs_addWidthLayout:(CGFloat)width
{
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1
                                                               constant:width];
    
    [self addConstraint:layout];
}

- (void)zs_addHeightLayout:(CGFloat)height
{
    NSLayoutConstraint *layout = [NSLayoutConstraint constraintWithItem:self
                                                              attribute:NSLayoutAttributeHeight
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:nil
                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                             multiplier:1
                                                               constant:height];
    
    [self addConstraint:layout];
}



/// 添加圆角
- (void)zs_addCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/// 添加边框
- (void)zs_addBorder:(CGFloat)width color:(UIColor *)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

/// 添加边框和圆角
- (void)zs_addBorder:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)radius
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}



/// 设置最小 X 值
- (void)zs_setMinX:(CGFloat)minX
{
    CGRect frame = self.frame;
    frame.origin.x = minX;
    self.frame = frame;
}

/// 设置最小 Y 值
- (void)zs_setMinY:(CGFloat)minY
{
    CGRect frame = self.frame;
    frame.origin.y = minY;
    self.frame = frame;
}

/// 设置 origin
- (void)zs_setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

/// 设置 size
- (void)zs_setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

/// 设置最大 X 值
- (void)zs_setMaxX:(CGFloat)maxX
{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width;
    self.frame = frame;
}

/// 设置最大 Y 值
- (void)zs_setMaxY:(CGFloat)maxY
{
    CGRect frame = self.frame;
    frame.origin.y = maxY - frame.size.height;
    self.frame = frame;
}


@end




@implementation UIView (XLoader)


+ (instancetype)zs_loadInstanceFromNib
{
    return [self zs_loadInstanceFromNibWithName:NSStringFromClass([self class])];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName
{
    return [self zs_loadInstanceFromNibWithName:nibName owner:nil];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner
{
    return [self zs_loadInstanceFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}

+ (instancetype)zs_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle
{
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            break;
        }
    }
    return result;
}


@end



@implementation UIView (XAction)

typedef void (^ZSTapBlock)(void);

- (UITapGestureRecognizer *)zs_addTapGesture:(void(^)(void))block {
    return [self zs_addTapGestureWithTaps:1 requireGestureRecognizerToFail:nil tapAction:block];
}

- (UITapGestureRecognizer *)zs_addTapGestureWithTaps:(NSUInteger)numberOfTaps
                      requireGestureRecognizerToFail:(nullable UIGestureRecognizer *)otherGesture
                                           tapAction:(void(^)(void))block

{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zs_mutilTapAction:)];
    tap.numberOfTapsRequired = numberOfTaps;
    [self addGestureRecognizer:tap];
    
    if (otherGesture) {
        [otherGesture requireGestureRecognizerToFail:tap];
    }
    
    [self saveBlock:block withTap:tap];
    
    return tap;
}


- (void)zs_mutilTapAction:(UITapGestureRecognizer *)tap
{
    if (UIGestureRecognizerStateRecognized == tap.state)
    {
        ZSTapBlock block = [[self cacheBlocks] objectForKey:[NSString stringWithFormat:@"zs_tapblockkey_%ld", tap.numberOfTapsRequired]];
        if (block) {
            block();
        }
    }
}


- (void)saveBlock:(ZSTapBlock)block withTap:(UITapGestureRecognizer *)tap {
    [[self cacheBlocks] setObject:block forKey:[NSString stringWithFormat:@"zs_tapblockkey_%ld", tap.numberOfTapsRequired]];
}

- (NSMutableDictionary *)cacheBlocks
{
    id blocks = objc_getAssociatedObject(self, "zsrt_cacheBlocks");
    if (!blocks)
    {
        blocks = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, "zsrt_cacheBlocks", blocks, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return (NSMutableDictionary *)blocks;
}





@end
