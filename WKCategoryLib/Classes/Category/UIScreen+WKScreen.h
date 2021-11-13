//
//  UIScreen+WKScreen.h
//  Pods
//
//  Created by kingboyrang on 2021/11/9.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (WKScreen)
/**
 屏幕尺寸
 */
+ (CGSize)size;

/**
屏幕宽度
*/
+ (CGFloat)width;

/**
屏幕高度
*/
+ (CGFloat)height;

/**
屏幕缩放率
*/
+ (CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
