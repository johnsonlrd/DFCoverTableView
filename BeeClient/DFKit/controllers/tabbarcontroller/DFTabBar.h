//
//  DFTabBar.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DFTabBarItem.h"

@class DFTabBar;

@protocol DFTabBarDelegate <NSObject>
- (void)dfTabBar:(DFTabBar *)dfTabBar didSelectedItemAtIndex:(NSInteger)index;
@end

@interface DFTabBar : UITabBar

@property (nonatomic, weak) id<DFTabBarDelegate> dfdelegate;

@property (nonatomic, strong) NSArray * allItems;
@property (nonatomic, strong) DFTabBarItem * dfSelectedItem;
@property (nonatomic, strong) UIColor * dfBackGroundColor;
@property (nonatomic, strong) UIImage * dfBackGroundImage;

- (void)setItems:(NSArray *)items;

@end
