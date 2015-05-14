//
//  DFBarButtonItem.m
//  WeAreKit
//
//  Created by Stefanie on 14/12/29.
//  Copyright (c) 2014年 Stefanie. All rights reserved.
//


#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#import "DFBarButtonItem.h"

#pragma mark - ButtonCustomView
@interface DFBarButtonCustomView : UIButton

@property (nonatomic, copy) BarButtonCallBack barButtonBlock;

// 初始化CustomView
- (void)initViewWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style barButtonCallBack:(void(^)(void))event;

@end

@implementation DFBarButtonCustomView

- (void)initViewWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style barButtonCallBack:(void(^)(void))event
{
    CGSize titleSize = CGSizeZero;
    
    // 设置Title内容
    if (title)
    {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.font = kBarButtonTitleFont;
        [self setTitleColor:kBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:kBarButtonTitleHighLightedColor forState:UIControlStateHighlighted];
        
        // 计算文本宽度
        titleSize = [title sizeWithAttributes:@{NSFontAttributeName : kBarButtonTitleFont}];
        
        //TODO: 10需要计算,为label与image间距离
//        titleSize.width += kGapOfImageTitle;
    }
    
    // 设置图片内容
    if (image)
    {
        [self setImage:image forState:UIControlStateNormal];
    }
    if (highLightedImage)
    {
        [self setImage:highLightedImage forState:UIControlStateHighlighted];
    }
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 计算自定义View的宽度
    self.frame = CGRectMake(0,
                            0,
                            MAX(kBarButtonImageIconW + titleSize.width,
                                kMinTouchRangeW),
                            kMinTouchRangeH);
    
    //Alignment
    if (style == LEFT_STYLE)
    {
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }
    else if (style == RIGHT_STYLE)
    {
        [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    
    // CallBack
    self.barButtonBlock = event;
}

@end

#pragma mark -- LeftCustomView
@interface  DFBarButtonCustomViewLeft: DFBarButtonCustomView

@end

@implementation DFBarButtonCustomViewLeft
/*
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super imageRectForContentRect:contentRect];
    rect.size = CGSizeMake(kBarButtonImageIconW, kBarButtonImageIconH);
    return rect;
}
 */

- (UIEdgeInsets)alignmentRectInsets
{
    if (IS_OS_7_OR_LATER)
    {
       return UIEdgeInsetsMake(0, 10.0f, 0, 0);
    }
    return UIEdgeInsetsZero;
}

@end

#pragma mark -- RightCustomView
@interface DFBarButtonCustomViewRight : DFBarButtonCustomView

@end

@implementation DFBarButtonCustomViewRight
/*
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rect = [super imageRectForContentRect:contentRect];
    rect.size = CGSizeMake(kBarButtonImageIconW, kBarButtonImageIconH);
    return rect;
}
*/
- (UIEdgeInsets)alignmentRectInsets
{
    if (IS_OS_7_OR_LATER)
    {
       return UIEdgeInsetsMake(0, 0, 0, 10.0f);
    }
    return UIEdgeInsetsZero;
}

@end



#pragma mark -
@implementation DFBarButtonItem

// 调用系统Image方法
// 设置Image
+ (DFBarButtonItem *)getBarButtonItemWithImage:(UIImage *)image itemClicked:(void(^)(void))event
{
    DFBarButtonItem * barButtonItem = [[DFBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleBordered target:self action:@selector(barButtonItemClicked:)];
    barButtonItem.barButtonBlock = event;
    
    return barButtonItem;
}

// 设置Title
+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title itemClicked:(void(^)(void))event
{
    DFBarButtonItem * barButtonItem = [[DFBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStyleBordered target:self action:@selector(barButtonItemClicked:)];
    barButtonItem.barButtonBlock = event;
    return barButtonItem;
}


#pragma mark -
// 自定义BarButtonItem
+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event
{
    return [self getBarButtonItemWithTitle:title image:image highLightedImage:nil style:style itemClicked:event];
}

+ (DFBarButtonItem *)getBarButtonItemWithImage:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void(^)(void))event
{
    return [self getBarButtonItemWithTitle:nil image:image highLightedImage:highLightedImage style:style itemClicked:event];
}

+ (DFBarButtonItem *)getBarButtonItemWithTitle:(NSString *)title image:(UIImage *)image highLightedImage:(UIImage *)highLightedImage style:(DFBarButtonStyle)style itemClicked:(void (^)(void))event
{
    // 只设置Image情况
    if (title != nil && image == nil && highLightedImage == nil)
    {
        return [self getBarButtonItemWithTitle:title itemClicked:event];
    }
    // 只设置Title情况
    if (image != nil && title == nil && highLightedImage == nil)
    {
        return [self getBarButtonItemWithImage:image itemClicked:event];
    }
    
    
    // 满足自定义View条件
    DFBarButtonCustomView * customView = nil;
    
    if (style == LEFT_STYLE)
    {
        customView = [DFBarButtonCustomViewLeft buttonWithType:UIButtonTypeCustom];
    }
    else if (style == RIGHT_STYLE)
    {
        customView = [DFBarButtonCustomViewRight buttonWithType:UIButtonTypeCustom];
    }
    
    [customView initViewWithTitle:title image:image highLightedImage:highLightedImage style:style barButtonCallBack:event];
    [customView addTarget:self action:@selector(barButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    DFBarButtonItem * barButtonItem = [[DFBarButtonItem alloc]initWithCustomView:customView];
    return barButtonItem;
}


#pragma mark - 点击事件
// 自定义View点击事件
+ (void)barButtonClicked:(DFBarButtonCustomView *)sender
{
    sender.barButtonBlock();
}

// UIbarButtonItem点击事件
+ (void)barButtonItemClicked:(DFBarButtonItem *)sender
{
    sender.barButtonBlock();
}



@end
