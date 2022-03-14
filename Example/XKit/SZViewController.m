//
//  SZViewController.m
//  XKit
//
//  Created by willzh on 06/26/2019.
//  Copyright (c) 2019 willzh. All rights reserved.
//

#import "SZViewController.h"
//#import <XKit/XKit.h>
#import "XKit.h"
#import "SZPerson.h"
#import "SZTagView.h"



@interface SZViewController ()

@property (nonatomic, strong) NSString *hhaha;
@property (nonatomic, strong) SZPerson *peroson;

@end

@implementation SZViewController


#define KVOKeyPath(PATH)  @(((void)(NO && ((void)PATH, NO)), strchr(# PATH, '.') + 1))


- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = {{0, 0}, size};
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctf, color.CGColor);
    CGContextFillRect(ctf, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    NSLog(@"aaa:%@", [NSString zs_randomStringWithLength:12]);
    
    self.peroson = [[SZPerson alloc] init];
    
//    NSLog(@"self.view:%@", [self.view zs_getPropertyName]);
//    NSLog(@"hhaha:%@", [_peroson zs_getPropertyName:_peroson.name]);
//    NSLog(@"hhaha:%@", [self zs_getPropertyName:self.hhaha]);
    
//    NSLog(@"person:%@", KVOKeyPath(self.peroson.name));
//    NSLog(@"person:%@", KVOKeyPath(_peroson.name));
//    NSLog(@"person:%@", KVOKeyPath(_peroson.nameOne));
//    NSLog(@"person:%@", KVOKeyPath(_peroson.obj1));
    
    
    NSLog(@"unicode:%@", @"e652".zs_unicode);
    
    
    UIView *tv1 = [[UIView alloc] initWithFrame:CGRectMake(40, 100, 30, 30)];
    tv1.backgroundColor = ZS_ColorWithHexRGB(0xff00ff, 0.23);
    [self.view addSubview:tv1];
    
    [tv1.layer addAnimation:[CAKeyframeAnimation opacityAnimationWithValues:@[@0.0, @1.0, @0.0, @1.0, @0.0, @1.0, @0.0, @1.0, @0.0, @1.0,@0.0, @1.0, @0.0, @1.0, @0.0, @1.0, @0.0, @1.0] duration:10.5f beginTime:0.0] forKey:@"ani"];
    
    
    
    UIView *tv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    tv.backgroundColor = ZS_ColorWithHexRGB(0xff00ff, 0.93);
    [self.view addSubview:tv];
    
    [tv zs_setMaxY:130];
    [tv zs_setMaxX:110];
    [tv zs_setSize:CGSizeMake(40, 40)];
    
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    tf.backgroundColor = [UIColor lightGrayColor];
    tf.placeholder = @"hha";
    [self.view addSubview:tf];
    
    
    SZTagView *tag = [[SZTagView alloc] initWithFrame:CGRectMake(20, 180, 100, 32)];
    tag.cornerRadius = 16.0;
    tag.text = @"122/233";
    tag.bgColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    tag.textColor = [UIColor whiteColor];
    [self.view addSubview:tag];
    
    
    
//
//    
//    CGFloat x = 10.0;
//    CGFloat y = 70.0;
//    for (NSInteger i=0; i<30; i++)
//    {
//        UIView *tv = [[UIView alloc] initWithFrame:CGRectMake(x, y, 30, 30)];
//        tv.backgroundColor = ZS_ColorWithHexRGB(0xff00ff, 0.03 * i);
//        [self.view addSubview:tv];
//        
//        x += 40.0;
//        if (x > CGRectGetWidth([UIScreen mainScreen].bounds))
//        {
//            x = 10.0;
//            y += 40.0;
//        }
//    }
//    
//    
//    UIView *tv1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 30, 30)];
//    tv1.backgroundColor = ZS_ColorWithRGB(255, 0, 255);
//    [self.view addSubview:tv1];
//    
//    UIView *tv2 = [[UIView alloc] initWithFrame:CGRectMake(140, 200, 30, 30)];
//    tv2.backgroundColor = ZS_ColorWithHex(0xff00ff);
//    [self.view addSubview:tv2];
//    
//    UIView *tv3 = [[UIView alloc] initWithFrame:CGRectMake(180, 200, 30, 30)];
//    tv3.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
//    [self.view addSubview:tv3];
    
    
    [self zs_listenKeyboardNotificationShowOrChange:^(NSTimeInterval t, CGRect endFrame, UIViewAnimationCurve curve) {
        NSLog(@"111");
    } willHide:^(NSTimeInterval t, UIViewAnimationCurve curve) {
        NSLog(@"222");
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}




- (void)test
{
    [self resignFirstResponder];
    
//    NSString *s3 = nil;
//    NSString *s4;
//
//    NSLog(@"is empty:%d", [s3 zs_isEmpty]);
//    NSLog(@"is empty:%d", [s4 zs_isEmpty]);
}




- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self test];
}








@end
