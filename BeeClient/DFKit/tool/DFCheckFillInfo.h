//
//  DFCheckFillInfo.h
//  WeAreKit
//
//  Created by Stefanie on 14/12/31.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DFCheckFillInfo : NSObject


// 判断是否是电话号码格式的字符串
+ (BOOL)verifyIsPhoneNumberString:(NSString *)value;

// 判断是否是邮箱格式的字符串
+ (BOOL)verifyIsEmailAddress:(NSString *)value;

// 判断是否包含特殊字符
+ (BOOL)verifySpecialCharacters:(NSString *)value;

// 判断字符串长度范围
+ (BOOL)verifyString:(NSString *)value minLength:(NSInteger)minV maxLength:(NSInteger)maxV;

@end
