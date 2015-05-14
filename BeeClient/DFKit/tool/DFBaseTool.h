//
//  DFBaseTool.h
//  SchoolBBSClient
//
//  Created by Stefanie on 15/4/3.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface DFBaseTool : NSObject

+ (void)makeCallWithTelNo:(NSString *)telNo;

+ (void)setNavigationController:(UINavigationController *)navigationController
             navigationBarAlpha:(CGFloat)alpha;
@end
