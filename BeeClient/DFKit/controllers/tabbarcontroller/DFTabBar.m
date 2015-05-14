//
//  DFTabBar.m
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import "DFTabBar.h"

@interface DFTabBar ()

@property (nonatomic, strong) UIImageView * bgImageView;

@end

@implementation DFTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initViewWithFrame:frame];
    }
    return self;
}

- (void)initViewWithFrame:(CGRect)frame
{
    self.bgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
    [self addSubview:self.bgImageView];
}

- (void)setDfBackGroundColor:(UIColor *)dfBackGroundColor
{
    self.bgImageView.backgroundColor = dfBackGroundColor;
}

- (void)setDfBackGroundImage:(UIImage *)dfBackGroundImage
{
    self.bgImageView.image = dfBackGroundImage;
}

- (void)setItems:(NSArray *)items
{
    // 保存所有TabBarItem
    self.allItems = items;
    
    // 将TabBarItem添加到TabBar上
    NSInteger index = 0;
    for (DFTabBarItem * dfTabBarItem in items)
    {
        if (0 == index)
        {
            dfTabBarItem.selected = YES;
            self.dfSelectedItem = dfTabBarItem;
        }
        
        
        [dfTabBarItem addTarget:self action:@selector(dfTabBarClicked:) forControlEvents:UIControlEventAllEvents];
        
        [self addSubview:dfTabBarItem];
        
        index++;
    }
}


- (void)dfTabBarClicked:(DFTabBarItem *)sender
{
    self.dfSelectedItem = sender;
    
    for (DFTabBarItem * item in self.allItems)
    {
        item.selected = (item == sender) ? YES : NO;
    }
    
    // 代理返回事件
    if ([_dfdelegate respondsToSelector:@selector(dfTabBar:didSelectedItemAtIndex:)])
    {
        [_dfdelegate dfTabBar:self didSelectedItemAtIndex:sender.tag];
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
