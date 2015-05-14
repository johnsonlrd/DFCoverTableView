//
//  DFTabBarItem.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/26.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DFTabBarControllerConfig.h"

#import "DFTabModel.h"


@interface DFTabBarItem : UIButton

+ (DFTabBarItem *)getTabBarItemWithModel:(DFTabModel *)itemModel numberOfItem:(NSInteger)itemCount currentIndex:(NSInteger)index;

- (void)setItemBadgeNumber:(NSInteger)number;

@end
