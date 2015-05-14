//
//  DFTabBarControllerConfig.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#ifndef WeAreKit_DFTabBarControllerConfig_h
#define WeAreKit_DFTabBarControllerConfig_h

// Item 高度
#define itemH 49

// TabBar Icon 宽度,高度 - 官方建议大小(25x25)
#define itemIconW 25
#define itemIconH 25


// 设置TabBarItem Title属性
#define itemTitleColor [UIColor grayColor]          // item里标题默认颜色
#define selectedItemTitleColor [UIColor redColor]   // item被选中时标题的颜色
#define itemTitleFont [UIFont systemFontOfSize:12]  // item 标题 字体font
#define itemTitleHeight 12.0f                       // Title 高度(如何不含有设置为0)

// 设置BadgeValue相关属性
#define badgeValueViewImageName @"icon_nav_yishoucang_normal@2x.png"   // 小红圈 背景图片名称
#define badgeValueFont [UIFont systemFontOfSize:12]                 // 小红圈里字体的大小
#define badgeValueColor [UIColor whiteColor]                        // 小红圈里字体的颜色
#define badgeValueViewWH 15                                         // 小红圈的大小


#endif
