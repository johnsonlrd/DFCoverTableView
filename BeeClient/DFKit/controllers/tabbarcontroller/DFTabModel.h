//
//  DFTabModel.h
//  HappinessShop
//
//  Created by 许超 on 4/28/14.
//  Copyright (c) 2014 许超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DFTabModel : NSObject

@property (nonatomic, strong) UIImage * normalImage;
@property (nonatomic, strong )UIImage * selectedImage;
@property (nonatomic, strong) UIViewController * controller;
@property (nonatomic, strong) NSString * title;

@end
