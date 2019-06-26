//
//  NSString+XUtils.m
//  Pods-XKit_Example
//
//  Created by Will on 2019/6/26.
//

#import "NSString+XUtils.h"
#import <CoreText/CoreText.h>

@implementation NSString (XUtils)


#pragma mark - size 计算
/// 根据字符串的字体和 size 计算字符串实际 size
- (CGSize)sizeWithFont:(UIFont *)font inSize:(CGSize)size
{
    // 段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName : font , NSParagraphStyleAttributeName : style};
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

- (CGFloat)heightWithFont:(UIFont *)font maxWidth:(CGFloat)width {
    return [self sizeWithFont:font inSize:CGSizeMake(width, MAXFLOAT)].height;
}

- (CGFloat)widthWithFont:(UIFont *)font maxHeight:(CGFloat)height {
    return [self sizeWithFont:font inSize:CGSizeMake(MAXFLOAT, height)].width;
}



#pragma mark - 判断
- (BOOL)isEmpty
{
    if (self == nil || self == NULL || [self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
    if (trimedString.length == 0) {
        return YES;
    }
    return NO;
}



#pragma mark - 格式化
- (NSString *)moneyFormatWithFractionLength:(NSInteger)length
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = length;
    formatter.minimumFractionDigits = length;
    
    return [formatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
}




#pragma mark - 正则表达式
- (BOOL)matchRegex:(NSString *)regex
{
    //SELF MATCHES一定是大写
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return  [predicate evaluateWithObject:self];
}



#pragma mark - 字形
- (UIBezierPath *)bezierPathWithFont:(UIFont *)font
{
    CTFontRef ctFont = CTFontCreateWithName((__bridge CFStringRef)font.familyName, font.pointSize, NULL);
    NSDictionary *atts = [NSDictionary dictionaryWithObject:(__bridge id)ctFont forKey:(__bridge NSString*)kCTFontAttributeName];
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:self attributes:atts];
    CFRelease(ctFont);
    
    CGMutablePathRef letters = CGPathCreateMutable();
    CTLineRef line = CTLineCreateWithAttributedString((__bridge CFAttributedStringRef)attributed);
    CFArrayRef runArray = CTLineGetGlyphRuns(line);
    for (CFIndex runIndex = 0; runIndex < CFArrayGetCount(runArray); runIndex++)
    {
        CTRunRef run = (CTRunRef)CFArrayGetValueAtIndex(runArray, runIndex);
        CTFontRef runFont = CFDictionaryGetValue(CTRunGetAttributes(run), kCTFontAttributeName);
        
        for (CFIndex runGlyphIndex = 0; runGlyphIndex < CTRunGetGlyphCount(run); runGlyphIndex++)
        {
            CFRange thisGlyphRange = CFRangeMake(runGlyphIndex, 1);
            CGGlyph glyph;
            CGPoint position;
            CTRunGetGlyphs(run, thisGlyphRange, &glyph);
            CTRunGetPositions(run, thisGlyphRange, &position);
            
            CGPathRef letter = CTFontCreatePathForGlyph(runFont, glyph, NULL);
            CGAffineTransform t = CGAffineTransformMakeTranslation(position.x, position.y);
            CGPathAddPath(letters, &t, letter);
            CGPathRelease(letter);
        }
    }
    
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:letters];
    CGRect boundingBox = CGPathGetBoundingBox(letters);
    CGPathRelease(letters);
    CFRelease(line);
    
    // The path is upside down (CG coordinate system)
    [path applyTransform:CGAffineTransformMakeScale(1.0, -1.0)];
    [path applyTransform:CGAffineTransformMakeTranslation(0.0, boundingBox.size.height)];
    
    return path;
}





@end
