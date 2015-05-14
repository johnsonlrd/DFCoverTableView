//
//  DFCoverView.h
//  BeeClient
//
//  Created by Stefanie on 15/5/14.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DFCoverView : UIView

- (instancetype)initWithTableView:(UITableView *)tableView
                  headerImageView:(UIImageView *)headerImageView
                      coverHeight:(CGFloat)height;

@end
