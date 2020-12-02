//
//  SZTagView.h
//  XKit_Example
//
//  Created by Will on 2019/12/14.
//  Copyright © 2019 willzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SZTagView : UIView

@property (nonatomic, assign) CGFloat cornerRadius; //!< 圆角
@property (nonatomic, copy) NSString *text; //!< 文本内容
@property (nonatomic, strong) UIFont *font; //!< 字体
@property (nonatomic, assign) CGFloat lr_space; //!< 文字的左右距离
@property (nonatomic, strong) UIColor *textColor; //!< 文字颜色
@property (nonatomic, strong) UIColor *bgColor; //!< 背景色

@end

NS_ASSUME_NONNULL_END
