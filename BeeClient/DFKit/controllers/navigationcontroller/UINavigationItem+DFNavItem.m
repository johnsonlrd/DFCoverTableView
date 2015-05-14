//
//  UINavigationItem+DFNavItem.m
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import "UINavigationItem+DFNavItem.h"
#import "DFDevice.h"

@implementation UINavigationItem (DFNavItem)

- (void)setNavigationItemWithImage:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    [self setNavigationItemWithTitle:nil image:image highLightedImage:nil style:style itemClicked:event];
}

- (void)setNavigationItemWithTitle:(NSString *)title style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    [self setNavigationItemWithTitle:title image:nil highLightedImage:nil style:style itemClicked:event];
}

- (void)setNavigationItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    [self setNavigationItemWithTitle:nil image:image highLightedImage:highLightedImage style:style itemClicked:event];
}

- (void)setNavigationItemWithTitle:(NSString *)title image:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    [self setNavigationItemWithTitle:title image:image highLightedImage:nil style:style itemClicked:event];
}

- (void)setNavigationItemWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    DFBarButtonItem * barButtonItem = [DFBarButtonItem getBarButtonItemWithTitle:title image:image highLightedImage:highLightedImage style:style itemClicked:event];
    
    if (style == LEFT_STYLE)
    {
        self.leftBarButtonItem = barButtonItem;
    }
    else if (style == RIGHT_STYLE)
    {
        self.rightBarButtonItem = barButtonItem;
    }
}

// 自定义返回按钮
- (void)setCustomBackBarButtonWithContollerClass:(Class)className
{
    UIImage * backImg = [UIImage imageNamed:kBackNormalImage];
    //backImg = [backImg resizableImageWithCapInsets:UIEdgeInsetsMake(0, backImg.size.width - 1, 0, 0)];
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.1"))
    {
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:kBackText style:UIBarButtonItemStylePlain target:nil action:NULL];
        self.backBarButtonItem = backBarButton;
    }
    else
    {
        id appearance = [UIBarButtonItem appearanceWhenContainedIn:className, nil];
        [appearance setBackButtonBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
        self.backBarButtonItem = backBarButton;
    }
}

- (void)setCustomTitle:(NSString *)title
{
    CGSize titleViewSize = [title sizeWithAttributes:@{NSFontAttributeName : kBarButtonTitleFont}];
    UILabel * labTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, titleViewSize.width, 44)];
    labTitle.backgroundColor = [UIColor clearColor];
    labTitle.textColor = kCustomTitleColor;
    labTitle.font = kCustomTitleFont;
    labTitle.text = title;
    labTitle.textAlignment = NSTextAlignmentCenter;
    self.titleView = labTitle;
}

- (void)clearItems
{
    self.leftBarButtonItems = nil;
    self.rightBarButtonItems = nil;
    self.title = nil;
    self.titleView = nil;
}



@end
