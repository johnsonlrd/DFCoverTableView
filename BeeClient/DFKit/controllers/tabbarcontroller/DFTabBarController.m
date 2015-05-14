//
//  DFTabBarController.m
//  HappinessShop
//
//  Created by 许超 on 4/28/14.
//  Copyright (c) 2014 许超. All rights reserved.
//

#import "DFTabBarController.h"



static const CGFloat kTabBarDurationTime = 0.5f;

@interface DFTabBarController ()

@end

@implementation DFTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#define kTabWidth  [UIScreen mainScreen].bounds.size.width                      //宽
#define kTabHeight 49.0f                                                        //高
#define kPadXOff 0                                                              //x坐标
#define kPadYOff ([UIScreen mainScreen].bounds.size.height  - kTabHeight)       //y坐标
#define kXItemPad 0


// 重写setViewControllers方法
- (void)setViewControllers:(NSArray *)viewControllers
{
    [self setViewControllers:viewControllers withBackGroundColor:nil backImage:nil];
}

- (void)setViewControllers:(NSArray *)viewControllers withBackGroundColor:(UIColor *)backColor
{
    [self setViewControllers:viewControllers withBackGroundColor:backColor backImage:nil];
}

- (void)setViewControllers:(NSArray *)viewControllers withBackImage:(NSString *)backImg
{
    [self setViewControllers:viewControllers withBackGroundColor:nil backImage:backImg];
}

#pragma mark - 设置ViewControllers
- (void)setViewControllers:(NSArray *)viewControllers withBackGroundColor:(UIColor *)backColor backImage:(NSString *)backImg
{
    // 保存所有Model/保存所有Controller
    NSMutableArray * saveModelsArr = [NSMutableArray array];
    NSMutableArray * controllersArray = [NSMutableArray array];
    
    for (NSDictionary * dict in viewControllers)
    {
        DFTabModel * m = [[DFTabModel alloc]init];
        m.normalImage = [UIImage imageNamed:[dict objectForKey:kDFNormalFileKey]];
        m.selectedImage = [UIImage imageNamed:[dict objectForKey:kDFSelectedFileKey]];
        m.title = [dict objectForKey:kDFTitleKey];
        m.controller = [dict objectForKey:kDFViewControllerKey];
        
        [saveModelsArr addObject:m];
        [controllersArray addObject:m.controller];
    }
    
    
    // 自定义TabBar
    self.tabBar.hidden = YES;

    _dfTabBar = [[DFTabBar alloc]initWithFrame:self.tabBar.frame];
    _dfTabBar.dfdelegate = self;
    [self.view addSubview:_dfTabBar];
    
    // 保存所有TabBarItems
    NSMutableArray * dfTabBarItemsArr = [NSMutableArray array];
    for (int i = 0; i < saveModelsArr.count; i++)
    {
        DFTabModel * m = [saveModelsArr objectAtIndex:i];
        DFTabBarItem * dfTabBarItem = [DFTabBarItem getTabBarItemWithModel:m numberOfItem:saveModelsArr.count currentIndex:i];
        [dfTabBarItemsArr addObject:dfTabBarItem];
    }
    
    // 设置dfTabBarItems
    [_dfTabBar setItems:dfTabBarItemsArr];
    
    // 设置背景颜色/图片
    if (backColor)
    {
        _dfTabBar.dfBackGroundColor = backColor;
    }
    if (backImg)
    {
        _dfTabBar.dfBackGroundImage = [UIImage imageNamed:backImg];
    }
    
    [super setViewControllers:controllersArray];
}

#pragma mark - dfTabBar delegate method
- (void)dfTabBar:(DFTabBar *)dfTabBar didSelectedItemAtIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

#pragma mark - common method
- (void)setCurrentIndex:(NSInteger)index
{
    self.selectedIndex = index;
    
    [self.dfTabBar.allItems enumerateObjectsUsingBlock:^(DFTabBarItem * item, NSUInteger idx, BOOL *stop) {
        
        item.selected = (index == idx) ? YES : NO;
    }];
}

- (void)hiddenTabBarAnimation
{
    self.tabBar.hidden = YES;
    static BOOL hiddenAnimationing = NO;
    
    if (hiddenAnimationing)
    {
        return;
    }
    
    hiddenAnimationing = YES;
    
    [UIView animateWithDuration:kTabBarDurationTime animations:^{
        
        CGRect rect = _dfTabBar.frame;
        rect.origin.y += CGRectGetHeight(_dfTabBar.frame);
        _dfTabBar.frame = rect;
        
    } completion:^(BOOL finished) {
        
        hiddenAnimationing = NO;
        
    }];
}

- (void)showTabBarAnimation
{
    self.tabBar.hidden = YES;
    static BOOL showAnimationing = NO;
    
    if (showAnimationing)
    {
        return;
    }
    
    showAnimationing = YES;
    
    [UIView animateWithDuration:kTabBarDurationTime animations:^{
        
        _dfTabBar.frame = self.tabBar.frame;
        
    } completion:^(BOOL finished) {
        
        showAnimationing = NO;
        
    }];
}

- (void)hiddenTabBar
{
    self.tabBar.hidden = YES;
    _dfTabBar.hidden = YES;
}

- (void)showTabBar
{
    self.tabBar.hidden = YES;
    _dfTabBar.hidden = NO;
}



@end
