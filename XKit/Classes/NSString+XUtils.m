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
- (CGSize)zs_sizeWithFont:(UIFont *)font inSize:(CGSize)size
{
    // 段落样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName : font , NSParagraphStyleAttributeName : style};
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
}

- (CGFloat)zs_heightWithFont:(UIFont *)font maxWidth:(CGFloat)width {
    return [self zs_sizeWithFont:font inSize:CGSizeMake(width, MAXFLOAT)].height;
}

- (CGFloat)zs_widthWithFont:(UIFont *)font maxHeight:(CGFloat)height {
    return [self zs_sizeWithFont:font inSize:CGSizeMake(MAXFLOAT, height)].width;
}



#pragma mark - 判断
- (BOOL)zs_isEmpty
{
    if (self == NULL || [self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (self.length == 0) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimedString = [self stringByTrimmingCharactersInSet:set];
    if (trimedString.length == 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isNumber
{
    if ([self isEqualToString:@"-"] || [self isEqualToString:@"+"]) {
        return NO;
    }
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:@"-+0123456789."];
    NSString *str = [self stringByTrimmingCharactersInSet:cs];
    if(str.length > 0) {
        return NO;
    }
    return YES;
}



#pragma mark - 格式化
- (NSString *)zs_moneyFormatWithFractionLength:(NSInteger)length
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = length;
    formatter.minimumFractionDigits = length;
    
    return [formatter stringFromNumber:[NSNumber numberWithDouble:[self doubleValue]]];
}




#pragma mark - 正则表达式
- (BOOL)zs_matchRegex:(NSString *)regex
{
    //SELF MATCHES一定是大写
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return  [predicate evaluateWithObject:self];
}



#pragma mark - 字形
- (UIBezierPath *)zs_bezierPathWithFont:(UIFont *)font
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



#pragma mark -
+ (NSString *)zs_randomStringWithLength:(NSInteger)length
{
    NSString *string = @"";
    for (NSInteger i=0; i<length; i++) {
        string = [string stringByAppendingFormat:@"%c", 'a' + arc4random() % 26];
    }
    return string;
}


/// 26 进制转换。columnNumber = 1 返回 A，26 返回 Z，27 返回 AA，52 返回 AZ，53 返回 BA
+ (NSString *)zs_getColumnName:(NSInteger)columnNumber
{
    NSInteger colNum = columnNumber;
    if (colNum < 1) {
        return nil;
    }
    
    NSMutableString *colName = [NSMutableString string];
    while (colNum > 0)
    {
        char cstr = (char)('A' + (colNum - 1) % 26);
        [colName insertString:[NSString stringWithFormat:@"%c", cstr] atIndex:0];
        
        colNum = (colNum - 1) / 26;  // 减 1 因避免被 26 的倍数整除
    }
    
    return colName;
}




#pragma mark - 本地化
- (NSString *)zs_locallized {
    return NSLocalizedString(self, "");
}

- (NSString *)zs_localizedInTable:(NSString *)table {
    return NSLocalizedStringFromTable(self, table, "");
}

- (NSString *)zs_localizedInTable:(NSString *)table bundle:(NSBundle *)bundle {
    return NSLocalizedStringFromTableInBundle(self, table, bundle, "");
}


@end
