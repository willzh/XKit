//
//  UITextField+XUtils.m
//  Pods-XKit_Example
//
//  Created by Will on 2019/7/4.
//

#import "UITextField+XUtils.h"
#import <objc/runtime.h>

@implementation UITextField (XLimit)


- (void)zs_dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self zs_dealloc];
}



- (BOOL)isMonitor {
    return [(NSNumber *)objc_getAssociatedObject(self, "zsrt_isMonitor") boolValue];
}

- (void)setIsMonitor:(BOOL)isMonitor {
    objc_setAssociatedObject(self, "zsrt_isMonitor", @(isMonitor), OBJC_ASSOCIATION_ASSIGN);
}


- (NSInteger)zs_maxLength {
    return [(NSNumber *)objc_getAssociatedObject(self, "zsrt_textMaxLength") integerValue];
}

- (void)setZs_maxLength:(NSInteger)zs_maxLength
{
    if (![self isMonitor])
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [self setIsMonitor:YES];
        
        SEL originSEL = NSSelectorFromString(@"dealloc");
        SEL swizzledSEL = @selector(zs_dealloc);
        Method originalMethod = class_getInstanceMethod(self.class, originSEL);
        Method swizzledMethod = class_getInstanceMethod(self.class, swizzledSEL);
        
        BOOL didAddMethod = class_addMethod(self.class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod)
        {
            class_replaceMethod(self.class, swizzledSEL, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        }else
        {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    }
    objc_setAssociatedObject(self, "zsrt_textMaxLength", @(zs_maxLength), OBJC_ASSOCIATION_ASSIGN);
}


#pragma mark - NSNotification
- (void)textDidChange:(NSNotification *)notice
{
    NSString *text = self.text;
    NSInteger length = self.zs_maxLength;
    if (text.length > length)
    {
        self.text = [text substringToIndex:length];
    }
}





@end



#pragma mark -
@implementation UITextField (XPlaceholder)

- (void)zs_setPlaceholderColor:(UIColor *)color font:(UIFont *)font
{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color, NSFontAttributeName: font}];
}




@end

