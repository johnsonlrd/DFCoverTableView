//
//  DFBaseTool.m
//  SchoolBBSClient
//
//  Created by Stefanie on 15/4/3.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import "DFBaseTool.h"

@implementation DFBaseTool
+ (void)makeCallWithTelNo:(NSString *)telNo
{
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@",telNo]];
    
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else
    {
        UIAlertView * av = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Call facility is not available!!!" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [av show];
    }
}

+ (void)setNavigationController:(UINavigationController *)navigationController navigationBarAlpha:(CGFloat)alpha
{
    if (alpha < 1.0f)
    {
        [navigationController.navigationBar setBackgroundImage:[[self class] imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];
        [navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    else
    {
        [navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [navigationController.navigationBar setShadowImage:nil];
    }
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}


@end
