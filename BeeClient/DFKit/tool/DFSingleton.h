//
//  DFSingleton.h
//  WeAreKit
//
//  Created by Stefanie on 15/1/5.
//  Copyright (c) 2015年 Stefanie. All rights reserved.
//

#ifndef WeAreKit_DFSingleton_h
#define WeAreKit_DFSingleton_h

#pragma mark - 单例
// 创建单例
#define SINGLETON_INTERFACE(className) +(className*)sharedInstance

#define SINGLETON_IMPLE(className) \
+(className *)sharedInstance { \
    static className *result; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        result = [[self alloc] init]; \
    }); \
    return result; \
} \



#endif
