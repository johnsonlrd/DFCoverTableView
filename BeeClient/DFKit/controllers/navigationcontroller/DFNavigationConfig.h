//
//  DFNavigationConfig.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/30.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#ifndef WeAreKit_DFNavigationConfig_h
#define WeAreKit_DFNavigationConfig_h

// 苹果官方建议icon 22x22
#define kBarButtonImageIconW 22.0f
#define kBarButtonImageIconH 22.0f

// 最小有效触摸范围(避免触摸区域过小,不宜点击)
#define kMinTouchRangeW 22.0f
#define kMinTouchRangeH 44.0f

// 返回按钮图片,文字
#define kBackNormalImage        @"back.png"
//#define kBackHighlightedImage   @""
#define kBackText               @" "


// BarButtonTitle设置
// 字体
#define kBarButtonTitleFont             [UIFont systemFontOfSize:16]
// 文本颜色
#define kBarButtonTitleColor            [UIColor whiteColor]
// 文本高亮颜色
#define kBarButtonTitleHighLightedColor [UIColor grayColor]

// CustomTitle设置
// 字体
#define kCustomTitleFont                [UIFont systemFontOfSize:18]
// 文本颜色
#define kCustomTitleColor               [UIColor whiteColor]

#endif
