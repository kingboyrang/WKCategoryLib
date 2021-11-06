//
//  UIColor+WKColor.h
//  Pods
//
//  Created by kingboyrang on 2021/11/6.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIColor* UIColorMakeRGB(CGFloat red, CGFloat green, CGFloat blue);
UIColor* UIColorMakeRGBWithAlpha(CGFloat red, CGFloat green, CGFloat blue,CGFloat alpha);

@interface UIColor (WKColor)

/**
生成随机颜色

@return 随机颜色
*/
+ (instancetype)randomColor;

/**
 十六进制转颜色

 @param hexStr 十六进制字符串(ff9ab00或#ff9ab00)
 @return 颜色对象
 */
+ (instancetype)colorWithHexStr:(NSString *)hexStr;

/**
 十六进制转颜色

 @param hexStr 十六进制字符串(ff9ab00或#ff9ab00)
 @param alpha  透明度
 @return 颜色对象
 */
+ (instancetype)colorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha;

@property (nonatomic, assign, readonly) CGFloat red;
@property (nonatomic, assign, readonly) CGFloat green;
@property (nonatomic, assign, readonly) CGFloat blue;
@property (nonatomic, assign, readonly) CGFloat alpha;

@end

NS_ASSUME_NONNULL_END
