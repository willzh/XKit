//
//  SZViewController.m
//  XKit
//
//  Created by willzh on 06/26/2019.
//  Copyright (c) 2019 willzh. All rights reserved.
//

#import "SZViewController.h"
#import <XKit/XKit.h>


@interface SZViewController ()

@end

@implementation SZViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CGFloat x = 10.0;
    CGFloat y = 70.0;
    for (NSInteger i=0; i<30; i++)
    {
        UIView *tv = [[UIView alloc] initWithFrame:CGRectMake(x, y, 30, 30)];
        tv.backgroundColor = ZS_ColorWithHexRGB(0xff00ff, 0.03 * i);
        [self.view addSubview:tv];
        
        x += 40.0;
        if (x > CGRectGetWidth([UIScreen mainScreen].bounds))
        {
            x = 10.0;
            y += 40.0;
        }
    }
    
    
    UIView *tv1 = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 30, 30)];
    tv1.backgroundColor = ZS_ColorWithRGB(255, 0, 255);
    [self.view addSubview:tv1];
    
    UIView *tv2 = [[UIView alloc] initWithFrame:CGRectMake(140, 200, 30, 30)];
    tv2.backgroundColor = ZS_ColorWithHex(0xff00ff);
    [self.view addSubview:tv2];
    
    UIView *tv3 = [[UIView alloc] initWithFrame:CGRectMake(180, 200, 30, 30)];
    tv3.backgroundColor = [UIColor colorWithRed:1 green:0 blue:1 alpha:1];
    [self.view addSubview:tv3];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
