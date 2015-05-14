//
//  DFTabBarController.h
//  HappinessShop
//
//  Created by 许超 on 4/28/14.
//  Copyright (c) 2014 许超. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DFTabBar.h"
#import "DFTabBarItem.h"
#import "DFTabModel.h"


#define kDFViewControllerKey    @"ViewControlelr"
#define kDFNormalFileKey        @"NormalFile"
#define kDFSelectedFileKey      @"SelectedFile"
#define kDFTitleKey             @"Title"


#define DefineDFTabBar(nFile, sFile, title, nController, arr) \
{   \
NSDictionary *d = [NSDictionary  dictionaryWithObjectsAndKeys:nFile, kDFNormalFileKey, sFile, kDFSelectedFileKey, title, kDFTitleKey, nController, kDFViewControllerKey, nil]; \
[arr addObject:d]; \
}

#define DefineDFTabBarWithOutTiltle DefineDFTabBar(nFile, sFile, @"", nController, arr) \




@interface DFTabBarController : UITabBarController <DFTabBarDelegate>

@property (nonatomic, strong) DFTabBar * dfTabBar;

- (void)setViewControllers:(NSArray *)viewControllers withBackImage:(NSString *)backImg;
- (void)setViewControllers:(NSArray *)viewControllers withBackGroundColor:(UIColor *)backColor;

- (void)setCurrentIndex:(NSInteger)index;

- (void)hiddenTabBarAnimation;
- (void)showTabBarAnimation;
- (void)hiddenTabBar;
- (void)showTabBar;

@end
