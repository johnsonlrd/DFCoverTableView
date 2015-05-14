//
//  DFDevice.m
//  DFKit
//
//  Created by Stefanie on 14-9-4.
//  Copyright (c) 2014年 Apple . All rights reserved.
//

#import "DFDevice.h"

@implementation DFDevice

#pragma mark - 判断设备宽,高,中心点
+ (CGFloat) getDeviceHeight
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return rect.size.height;
}
+ (CGFloat) getDeviceWidth
{
    CGRect rect = [[UIScreen mainScreen] bounds];
    return rect.size.width;
}
+ (CGFloat)getDeviceCenterX
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return CGRectGetMidX(screenBounds);
}
+ (CGFloat)getDeviceCenterY
{
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    return CGRectGetMidY(screenBounds);
}

#pragma mark - 判断设备型号
+ (BOOL) isIPhone5x
{
    if ([[self class] getDeviceHeight] == 1136/2){
        return YES;
    }
    return NO;
}

+ (BOOL) isIPhone6
{
    if ([[self class] getDeviceHeight] == 1334/2)
    {
        return YES;
    }
    return NO;
}

+ (BOOL) isIPhone6Plus
{
    if ([[self class] getDeviceHeight] == 2208 / 3)
    {
        return YES;
    }
    return NO;
}

#pragma mark - 判断设备类型
+ (BOOL) isUserInterfaceIdiom:(UIUserInterfaceIdiom)userInterfaceIdiom
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == userInterfaceIdiom)
    {
        return YES;
    }
    return NO;
}



@end
