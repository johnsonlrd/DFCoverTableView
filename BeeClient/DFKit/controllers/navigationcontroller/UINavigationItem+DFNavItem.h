//
//  UINavigationItem+DFNavItem.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFNavigationConfig.h"
#import "DFBarButtonItem.h"




@interface UINavigationItem (DFNavItem)

- (void)setNavigationItemWithImage:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

- (void)setNavigationItemWithTitle:(NSString *)title style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

- (void)setNavigationItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

- (void)setNavigationItemWithTitle:(NSString *)title image:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

- (void)setNavigationItemWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event;

// 自定义返回按钮
- (void)setCustomBackBarButtonWithContollerClass:(Class)className;

// 设置Title
- (void)setCustomTitle:(NSString *)title;

// 清除
- (void)clearItems;

@end
