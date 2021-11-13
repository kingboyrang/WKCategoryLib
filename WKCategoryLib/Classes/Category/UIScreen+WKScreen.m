//
//  UIScreen+WKScreen.m
//  Pods
//
//  Created by kingboyrang on 2021/11/9.
//

#import "UIScreen+WKScreen.h"

@implementation UIScreen (WKScreen)

// 尺寸
+ (CGSize)size
{
    return [[UIScreen mainScreen] bounds].size;
}

// 宽度
+ (CGFloat)width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

// 高度
+ (CGFloat)height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

// 缩放率
+ (CGFloat)scale
{
    return [UIScreen mainScreen].scale;
}

@end
