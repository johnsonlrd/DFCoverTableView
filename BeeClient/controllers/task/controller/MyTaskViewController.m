//
//  MyTaskViewController.m
//  BeeClient
//
//  Created by Stefanie on 15/5/13.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

// Controller
#import "MyTaskViewController.h"
#import "AddTaskViewController.h"
#import "DFTabBarController.h"

// View
#import "DFCoverView.h"
#import "TaskCell.h"
#import "PhotoHeaderView.h"

// Utility
#import <Masonry.h>
#import "UINavigationItem+DFNavItem.h"
#import "DFBaseTool.h"

@interface MyTaskViewController () <UITableViewDataSource, UITableViewDelegate>

// UI
@property (strong, nonatomic) UITableView *tableView;
@property (nonatomic, strong) PhotoHeaderView * headerV;
@property (nonatomic, strong) UIImageView * headerBackImageView;

@end

@implementation MyTaskViewController

#pragma mark - Appearance
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Show tabbar
    DFTabBarController * tab = (DFTabBarController *)self.navigationController.tabBarController;
    [tab showTabBarAnimation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // Nav
    [self buildNav];

    // UI
    [self buildUI];
}

#pragma mark - UI
- (void)buildNav
{
    self.navigationController.navigationBar.translucent = YES;
    [DFBaseTool setNavigationController:self.navigationController navigationBarAlpha:0.0f];
    self.navigationItem.title = @"我的任务";
    
    __weak MyTaskViewController * vc = self;
    [self.navigationItem setNavigationItemWithTitle:@"添加任务" style:RIGHT_STYLE itemClicked:^{
        [vc gotoAddTaskVC];
    }];
}

- (void)buildUI
{
    // TableView
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    // TableView headerView
    _headerV = [[PhotoHeaderView alloc]init];
    _tableView.tableHeaderView = _headerV;
    
    // Header back imageview
    _headerBackImageView = [[UIImageView alloc]init];
    _headerBackImageView.backgroundColor = [UIColor orangeColor];
    
    // CoverView
    _coverView = [_coverView initWithTableView:_tableView headerImageView:_headerBackImageView coverHeight:[_headerV headerViewHeight]];
    [self.view addSubview:_coverView];
    
    // Mas
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(@0);
    }];

}

#pragma mark - Control
- (void)gotoAddTaskVC
{
    // Hidden
    DFTabBarController * tab = (DFTabBarController *)self.navigationController.tabBarController;
    [tab hiddenTabBarAnimation];

    AddTaskViewController * addTaskVC = [[AddTaskViewController alloc]initWithNibName:NSStringFromClass([AddTaskViewController class]) bundle:nil];
    addTaskVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addTaskVC animated:YES];
}


#pragma mark - TableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * strId = @"ReuseTaskCell";
    TaskCell * cell = (TaskCell *)[tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TaskCell class]) owner:self options:nil] lastObject];
    }
    return cell;
}

#pragma mark - ScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _tableView)
    {
        // Alpha
        CGFloat alpha = scrollView.contentOffset.y / 150.0f;
        [DFBaseTool setNavigationController:self.navigationController navigationBarAlpha:alpha];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
