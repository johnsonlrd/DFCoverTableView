//
//  AppDelegate.m
//  BeeClient
//
//  Created by Stefanie on 15/5/11.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import "AppDelegate.h"

#import "MyTaskViewController.h"
#import "CustomerViewController.h"
#import "RewardViewController.h"
#import "MoreViewController.h"
#import "DFTabBarController.h"

#import "DFFuncMacro.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];

    self.window.rootViewController = [self p_buildTabBarController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - private function method
- (DFTabBarController *)p_buildTabBarController
{
    // 1.Create controllers
    DefineNavControllerWithXIB(MyTaskViewController, taskVC);
    DefineNavControllerWithXIB(CustomerViewController, customerVC);
    DefineNavControllerWithXIB(RewardViewController, rewardVC);
    DefineNavControllerWithXIB(MoreViewController, moreVC);
    
    // 2.TabBar ViewControllers
    NSMutableArray * viewControllersArray = [NSMutableArray array];
    DefineDFTabBar(@"icon_tab_shouye_normal.png",
                   @"icon_tab_shouye_highlight.png",
                   @"我的任务",
                   taskVC,viewControllersArray);
    DefineDFTabBar(@"icon_tab_fujin_normal.png",
                   @"icon_tab_fujin_highlight.png",
                   @"我的客户",
                   customerVC, viewControllersArray);
    DefineDFTabBar(@"icon_tab_wode_normal.png",
                   @"icon_tab_wode_highlight.png",
                   @"我的奖励",
                   rewardVC, viewControllersArray);
    DefineDFTabBar(@"icon_tab_gengduo_normal.png",
                   @"icon_tab_gengduo_highlight.png",
                   @"更多",
                   moreVC, viewControllersArray);
    
    // 3.Create TabBarController
    DFTabBarController * tabBarController = [[DFTabBarController alloc]init];
    [tabBarController setViewControllers:viewControllersArray withBackGroundColor:kUIColorFromRGB(0x016ab5)];
    
    // 4.Return
    return tabBarController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
