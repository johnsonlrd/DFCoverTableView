//
//  DFTabBarItem.m
//  WeAreKit
//
//  Created by Stefanie on 14/12/26.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import "DFTabBarItem.h"

@interface DFTabBarItem ()

@property (nonatomic, strong) UIButton * badgeValueView;

@end

@implementation DFTabBarItem
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


+ (DFTabBarItem *)getTabBarItemWithModel:(DFTabModel *)itemModel numberOfItem:(NSInteger)itemCount currentIndex:(NSInteger)index
{
    CGFloat itemW = ([[UIScreen mainScreen] bounds].size.width / itemCount);
    DFTabBarItem * item = [[DFTabBarItem alloc] initWithFrame:CGRectMake(0, 0, itemW, itemH)];
    item.tag = index;
    
    // 更新Item坐标
    [item updateOriginByIndex:index];
    
    // 设置Item信息
    [item configItemWithItemModel:itemModel];
    
    return item;
}

#pragma mark - 更新坐标位置
- (void)updateOriginByIndex:(NSInteger)index
{
    CGFloat offSetX = 0.0f;
    CGFloat offSetY = 0.0f;
    offSetX += index * CGRectGetWidth(self.frame);
    self.frame = CGRectMake(offSetX, offSetY, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

#pragma mark - 设置Item的信息
- (void)configItemWithItemModel:(DFTabModel *)itemModel
{
    if (itemModel.title != nil)
    {
        [self setTitle:itemModel.title forState:UIControlStateNormal];
    }
    if (itemModel.normalImage != nil)
    {
        [self setImage:itemModel.normalImage forState:UIControlStateNormal];
    }
    if (itemModel.selectedImage != nil)
    {
        [self setImage:itemModel.selectedImage forState:UIControlStateSelected];
        [self setImage:itemModel.selectedImage forState:UIControlStateHighlighted];
        [self setImage:itemModel.selectedImage forState:UIControlStateSelected | UIControlStateHighlighted];
    }
}

#pragma mark - 设置小红圈里的数字
- (void)setItemBadgeNumber:(NSInteger)number
{
    if (number != 0)
    {
        if (self.badgeValueView.hidden) {
            self.badgeValueView.hidden = NO;
        }
        
        [self.badgeValueView setTitle:[NSString stringWithFormat:@"%ld", number] forState:UIControlStateNormal];
    }
    else
    {
        self.badgeValueView.hidden = YES;
    }
}

- (UIButton *)badgeValueView
{
    if (_badgeValueView == nil)
    {
        CGRect iconImageViewFrame = self.imageView.frame;
        _badgeValueView = [UIButton buttonWithType:UIButtonTypeCustom];
        _badgeValueView.frame = CGRectMake(CGRectGetMaxX(iconImageViewFrame) + 5,
                                           CGRectGetMinY(iconImageViewFrame) - 5,
                                           badgeValueViewWH,
                                           badgeValueViewWH);
        [_badgeValueView setBackgroundImage:[UIImage imageNamed:badgeValueViewImageName] forState:(UIControlStateNormal)];
        _badgeValueView.titleLabel.font = badgeValueFont;
        [_badgeValueView setTitleColor:badgeValueColor forState:(UIControlStateNormal)];
        _badgeValueView.adjustsImageWhenHighlighted = NO;
        _badgeValueView.hidden = YES;
    }
    return _badgeValueView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        // 设置按钮文字颜色
        [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
        // 设置按钮文字高亮颜色
        [self setTitleColor:selectedItemTitleColor forState:UIControlStateSelected];
        [self setTitleColor:selectedItemTitleColor forState:UIControlStateHighlighted];
        [self setTitleColor:selectedItemTitleColor forState:UIControlStateSelected | UIControlStateHighlighted];
        // 发光效果
//        self.showsTouchWhenHighlighted = YES;
        // 设置按钮文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 设置文字的字体
        self.titleLabel.font = itemTitleFont;
        // 让图片按原比例显示出来
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 添加BadgeValue
        [self addSubview:self.badgeValueView];
        // 图片状态改变不修改图片
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}


- (CGRect)backgroundRectForBounds:(CGRect)bounds
{
    return [super backgroundRectForBounds:bounds];
}

- (CGRect)contentRectForBounds:(CGRect)bounds
{
    return [super contentRectForBounds:bounds];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0.0f;
    CGFloat titleY = contentRect.size.height - itemTitleHeight - 2;
    CGFloat titleWidth = contentRect.size.width;
    CGFloat titleHiget = itemTitleHeight;
    return CGRectMake(titleX, titleY, titleWidth, titleHiget);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = (contentRect.size.width - itemIconW) / 2.0;
    CGFloat imageY = (contentRect.size.height - itemIconH) / 2.0 - 5;
    return CGRectMake(imageX, imageY, itemIconW, itemIconH);
}

@end
