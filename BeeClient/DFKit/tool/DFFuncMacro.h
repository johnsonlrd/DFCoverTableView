//
//  DFFuncMacro.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/26.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#ifndef WeAreKit_DFFuncMacro_h
#define WeAreKit_DFFuncMacro_h


//--------------
// @name 打印日志
//--------------

#pragma mark - 打印日志

// DEBUG模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

// 重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

// DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif

//-----------
// @name 断言
//-----------



//-----------
// @name 内存
//-----------

#pragma mark - 内存

// 使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

// 释放一个对象
#define SAFE_DELETE(P) if(P) { [P release], P = nil; }


//-------------
// @name 控制器
//-------------

#pragma mark - 控制器

// 创建导航控制器
#define DefineNavController(className,nControllerName) \
UINavigationController * nControllerName = [[UINavigationController alloc]initWithRootViewController:([[className alloc]init])];

// 用XIB创建导航控制器
#define DefineNavControllerWithXIB(className,nControllerName) \
UINavigationController * nControllerName = [[UINavigationController alloc]initWithRootViewController:([[className alloc]initWithNibName:NSStringFromClass([className class]) bundle:nil])];

// 创建控制器
#define DefineUIViewController(className, controllerName) \
className * controllerName = [[className alloc] init];

// 用XIB创建控制器
#define DefineUIViewControllerWithXIB(className, controllerName) \
className * controllerName = [[className alloc]initWithNibName:NSStringFromClass([className class]) bundle:nil];


//-----------
// @name 图片
//-----------

#pragma mark - 图片

#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]



//--------
// @ 数学
//--------

#pragma mark - 数学算法

// 由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)



//--------------
// @ 数据类型判断
//--------------

#pragma mark - 判断数据类型

// 判断字符串是否为空
#define IFISNIL(v)                                 (v = (v != nil) ? v : @"")

// 判断NSNumber是否为空
#define IFISNILFORNUMBER(v)                        (v = (v != nil) ? v : [NSNumber numberWithInt:0])

// 判断是否是字符串
#define IFISSTR(v)                                 (v = ([v isKindOfClass:[NSString class]]) ? v : [NSString stringWithFormat:@"%@",v])



//----------------
// @name 常用字符串
//----------------
#pragma mark - 常用字符串

#define EMPTY_STRING                                    @""

#define YES_STRING                                      @"YES"
#define NO_STRING                                       @"NO"

#define TRUE_STRING                                     @"true"
#define FALSE_STRING                                    @"false"

#define ZERO_STRING                                     @"0"

#define GET_STRING                                      @"GET"
#define POST_STRING                                     @"POST"

#define CANCEL_STRING                                   @"取消"
#define CONFIRM_STRING                                  @"确认"

//------------
// @name 时间
//------------
#pragma mark - 常用时间

/** 时间间隔 */
#define kHUDDuration            (1.f)

/** 一天的秒数 */
#define SecondsOfDay            (24.f * 60.f * 60.f)
/** 秒数 */
#define Seconds(Days)           (24.f * 60.f * 60.f * (Days))

/** 一天的毫秒数 */
#define MillisecondsOfDay       (24.f * 60.f * 60.f * 1000.f)
/** 毫秒数 */
#define Milliseconds(Days)      (24.f * 60.f * 60.f * 1000.f * (Days))

//------------
// @name 颜色
//------------

#pragma mark - 颜色参数
// 随机颜色值
#define kRandomColor kUIColorRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
// RGB颜色
#define kUIColorRGB(rColor,gColor,bColor) [UIColor colorWithRed:rColor /255.0 green:gColor / 255.0 blue:bColor / 255.0 alpha:1]
// RGBA颜色
#define kUIColorRGBA(rColor,gColor,bColor, alphaValue) [UIColor colorWithRed:rColor /255.0 green:gColor / 255.0 blue:bColor / 255.0 alpha:alphaValue]
// 16进制颜色
#define kUIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
