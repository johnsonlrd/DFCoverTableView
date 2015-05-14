//
//  DFCheckFillInfo.m
//  WeAreKit
//
//  Created by Stefanie on 14/12/31.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//

#import "DFCheckFillInfo.h"

@implementation DFCheckFillInfo

// 判断是否是电话号码格式的字符串
+ (BOOL)verifyIsPhoneNumberString:(NSString *)value
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:value];
}

// 判断是否是邮箱格式的字符串
+ (BOOL)verifyIsEmailAddress:(NSString *)value
{
    //正则表达式
    NSString *regexStr  =   @"^[_\\.0-9a-z-]+@([0-9a-z][0-9a-z-]+\\.)+[a-z]{2,4}$";
    NSRange range       =   [value rangeOfString:regexStr options:NSRegularExpressionSearch];
    if(NSNotFound == range.location)
    {
        return NO;
    }
    return YES;
}

// 判断是否含有特殊字符
+ (BOOL)verifySpecialCharacters:(NSString *)value
{
    NSString *phoneRegex = @"^[\u4E00-\u9FA5A-Za-z0-9_]+$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return ![phoneTest evaluateWithObject:value];
}

// 判断字符串长度范围
+ (BOOL)verifyString:(NSString *)value minLength:(NSInteger)minV maxLength:(NSInteger)maxV
{
    if (value.length >= minV && value.length <= maxV)
    {
        return YES;
    }
    return NO;
}

@end
