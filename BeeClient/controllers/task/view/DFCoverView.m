//
//  DFCoverView.m
//  BeeClient
//
//  Created by Stefanie on 15/5/14.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import "DFCoverView.h"

@interface DFCoverView ()

@property (nonatomic, assign) CGFloat coverHeight;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIImageView * headerImageView;

@end

@implementation DFCoverView

- (instancetype)initWithTableView:(UITableView *)tableView headerImageView:(UIImageView *)headerImageView coverHeight:(CGFloat)height
{
    if (self = [super init])
    {
        self.bounds = [UIScreen mainScreen].bounds;
        
        // Color
        tableView.backgroundColor = [UIColor clearColor];
        
        // Save
        _tableView = tableView;
        _headerImageView = headerImageView;
        _coverHeight = height;
        
        // Frame
        _headerImageView.frame = CGRectMake(0, 0, self.bounds.size.width, height);
        
        // Addsubview
        [self addSubview:_tableView];
        [self insertSubview:_headerImageView belowSubview:_tableView];
        
        // Observer
        [tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        // Change headerbackImageHeight
        CGRect rect = _headerImageView.frame;
        rect.size.height = MAX(0, _coverHeight - _tableView.contentOffset.y);
        _headerImageView.frame = rect;
    }
}

- (void)dealloc
{
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
