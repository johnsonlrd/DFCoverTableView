//
//  DFBarButtonItem.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFNavigationConfig.h"

// Block
typedef void (^BarButtonCallBack)(void);

typedef NS_ENUM(NSInteger, DFBarButtonStyle)
{
    //Left
    LEFT_STYLE = 0,
    
    //RIGHT
    RIGHT_STYLE,
};

@interface DFBarButtonItem : UIBarButtonItem

@property (nonatomic, copy) BarButtonCallBack barButtonBlock;

// 自定义
// 设置Title, Image
+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

// 设置Image, HighLightedImage
+ (DFBarButtonItem *)getBarButtonItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

// 设置Title, Image, HighLightedImage
+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;


// 设置Image
+ (DFBarButtonItem *)getBarButtonItemWithImage:(UIImage *)image itemClicked:(void(^)(void))event;
// 设置Title
+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title itemClicked:(void(^)(void))event;

@end
