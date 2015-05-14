//
//  PhotoHeaderView.m
//  BeeClient
//
//  Created by Stefanie on 15/5/13.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import "PhotoHeaderView.h"
#import <Masonry.h>

@implementation PhotoHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    self.frame = CGRectMake(0, 0, CGRectGetWidth(screenBounds), [self headerViewHeight]);
    self.backgroundColor = [UIColor clearColor];
    
    // Btn photo
    UIButton * btnPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    btnPhoto.layer.cornerRadius = 100 / 2;
    btnPhoto.layer.borderWidth = 2.0f;
    btnPhoto.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:btnPhoto];
    
    // Lab name
    UILabel * labName = [[UILabel alloc]init];
    labName.text = @"曾经的毁灭者";
    labName.textColor = [UIColor whiteColor];
    labName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labName];
    
    // Mas
    [labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@0);
        make.top.equalTo(btnPhoto.mas_bottom).offset(20);
    }];
    
    [btnPhoto mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@100);
        make.center.equalTo(@0);
    }];
}

- (CGFloat)headerViewHeight
{
    return 250.0f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
