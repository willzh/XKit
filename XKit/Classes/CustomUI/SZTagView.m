//
//  SZTagView.m
//  XKit_Example
//
//  Created by Will on 2019/12/14.
//  Copyright © 2019 willzh. All rights reserved.
//

#import "SZTagView.h"

@implementation SZTagView

@synthesize font = _font;


#pragma mark - init
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


#pragma mark - Setter & Getter
- (void)setText:(NSString *)text
{
    _text = text;
    
    NSDictionary *attr = [self textAttributes];
    CGSize size = [self.text sizeWithAttributes:attr];
    CGRect fr = self.frame;
    fr.size = CGSizeMake(size.width + self.lr_space * 2, fr.size.height);
    self.frame = fr;
    
    [self setNeedsDisplay];
}

- (UIColor *)textColor
{
    if (!_textColor) {
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

- (UIColor *)bgColor
{
    if (!_bgColor) {
        _bgColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    }
    return _bgColor;
}

- (UIFont *)font
{
    if (!_font) {
        _font = [UIFont systemFontOfSize:12];
    }
    return _font;
}

- (void)setFont:(UIFont *)font
{
    _font = font;
    
    [self setNeedsDisplay];
}

- (CGFloat)lr_space
{
    if (_lr_space <= 0) {
        _lr_space = 8.0;
    }
    return _lr_space;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:[UIColor clearColor]];
    
}

#pragma mark - Draw
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    
    UIBezierPath *bg = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.cornerRadius];
    CGContextSetFillColorWithColor(ctf, self.bgColor.CGColor);
    CGContextAddPath(ctf, bg.CGPath);
    CGContextDrawPath(ctf, kCGPathFill);
    
    NSDictionary *attr = [self textAttributes];
    CGSize size = [self.text sizeWithAttributes:attr];
    [_text drawInRect:CGRectMake(self.lr_space, (CGRectGetHeight(self.frame) - size.height) / 2.0, size.width, size.height) withAttributes:attr];
}



#pragma mark - Private Methods
- (NSDictionary *)textAttributes
{
    return @{NSForegroundColorAttributeName: self.textColor,
             NSFontAttributeName: self.font};
}




@end
