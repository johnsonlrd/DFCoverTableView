//
//  AddTaskViewController.m
//  BeeClient
//
//  Created by Stefanie on 15/5/13.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import "AddTaskViewController.h"

// View
#import "SignTaskCell.h"
#import "HomeTaskCell.h"
#import "PhotoHeaderView.h"

@interface AddTaskViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor purpleColor];
    
    PhotoHeaderView * photoHeaderV = [PhotoHeaderView new];
    _addTaskTableView.tableHeaderView = photoHeaderV;
    _addTaskTableView.tableFooterView = [UIView new];
    _addTaskTableView.backgroundColor = [UIColor clearColor];
}

#pragma mark - TableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        static NSString * strId = @"ReuseSignTaskCell";
        SignTaskCell * cell = (SignTaskCell *)[tableView dequeueReusableCellWithIdentifier:strId];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SignTaskCell class]) owner:self options:nil] lastObject];
        }
        return cell;
    }
    else
    {
        static NSString * strId = @"ReuseHomeTaskCell";
        HomeTaskCell * cell = (HomeTaskCell *)[tableView dequeueReusableCellWithIdentifier:strId];
        if (!cell)
        {
            cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([HomeTaskCell class]) owner:self options:nil] lastObject];
        }
        return cell;
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
