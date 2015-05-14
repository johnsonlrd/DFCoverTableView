//
//  DFDevice.h
//  DFKit
//
//  Created by Stefanie on 14-9-4.
//  Copyright (c) 2014年 Apple . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *  常用尺寸
 */

//https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/MobileHIG/IconMatrix.html#//apple_ref/doc/uid/TP40006556-CH27-SW1
#define kTabBarHeight       49
#define kNavBarHeight       64
#define kNavToolBarHeight   44
#define kStatusBarHeight    20

#define kNavIconSize    {22,22}
#define kTabBarIconSize {25,25}


/**
 *  获取当前App版本号
 */
#define CurrentAppVersion ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])

/**
 *  获取当前系统版本号
 */
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])

/**
 *  获取本机系统版本关系
 */
#define CurrentSystemName ([[UIDevice currentDevice] systemName])

/**
 *  获取本机当前语言
 */
#define CurrentSystemLanguage ([[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0])

/**
 *  判断系统版本关系
 *
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define IS_OS_5_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0)
#define IS_OS_6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IS_OS_7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_OS_8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)


/**
 *  判断是否为iPhone/iPad
 */
#define IsUserInterfaceIdiom(interfaceIdiom) ([[UIDevice currentDevice] userInterfaceIdiom] == interfaceIdiom)

/**
 *  判断是否iPhone5之后
 */
#define IsIphone5 [DFDevice isIPhone5x]

#define IsIphone6 [DFDevice isIPhone6]

#define IsIphone6Plus [DFDevice isIPhone6Plus]

/**
 *  获取屏幕宽高,中心点
 */
#define kScreenHeight [DFDevice getDeviceHeight]
#define kScreenWidth  [DFDevice getDeviceWidth]
#define kScreenMidX   [DFDevice getDeviceCenterX]
#define kScreenMidY   [DFDevice getDeviceCenterY]


@interface DFDevice : NSObject

+ (CGFloat) getDeviceHeight;
+ (CGFloat) getDeviceWidth;

+ (CGFloat) getDeviceCenterX;
+ (CGFloat) getDeviceCenterY;

/**
 *  判断是否为iPhone5/5s
 *
 *  @return YES为长屏(1136/2)
 */
+ (BOOL) isIPhone5x;

/**
 *  判断是否为iPhone6
 *
 *  @return YES为Iphone6(1334/2)
 */
+ (BOOL) isIPhone6;

/**
 *  判断是否为iPhone6Plus
 *
 *  @return YES为Iphone6Plus(2208/3)
 */
+ (BOOL) isIPhone6Plus;

/**
 *  判断是设备型号iPhone/iPad
 *
 *  @param userInterfaceIdiom UIUserInterfaceIdiomPhone/UIUserInterfaceIdiomPad
 *
 *  @return 返回是否为iPhone/iPad
 */
+ (BOOL) isUserInterfaceIdiom:(UIUserInterfaceIdiom)userInterfaceIdiom;

@end
