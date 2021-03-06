//
//  UIColor+WKColor.m
//  Pods
//
//  Created by kingboyrang on 2021/11/6.
//

#import "UIColor+WKColor.h"

UIColor* UIColorMakeRGB(CGFloat red, CGFloat green, CGFloat blue) {
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
}

UIColor* UIColorMakeRGBWithAlpha(CGFloat red, CGFloat green, CGFloat blue,CGFloat alpha){
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@implementation UIColor (WKColor)


/**
生成随机颜色

@return 随机颜色
*/
+ (instancetype)randomColor{
    
    CGFloat R = arc4random_uniform(256) / 255.0;
    CGFloat G = arc4random_uniform(256) / 255.0;
    CGFloat B = arc4random_uniform(256) / 255.0;
    return [[self class] colorWithRed:R green:G blue:B alpha:1.0];
}


/**
 十六进制转颜色

 @param hexStr 十六进制字符串
 @return 颜色对象
 */
+ (instancetype)colorWithHexStr:(NSString *)hexStr{
    
    return [[self class] colorWithHexStr:hexStr alpha:1.0];
}

/**
 十六进制转颜色

 @param hexStr 十六进制字符串
 @param alpha  透明度
 @return 颜色对象
 */
+ (instancetype)colorWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha{
    if (hexStr&&[hexStr hasPrefix:@"#"])
    {
        hexStr = [hexStr stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:@""];
    }
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != hexStr)
    {
        NSScanner *scanner = [NSScanner scannerWithString:hexStr];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:alpha];
    return result;
}

/**
 *  @brief  渐变颜色
 *
 *  @param c1     开始颜色
 *  @param c2     结束颜色
 *  @param height 渐变高度
 *
 *  @return 渐变颜色
 */
+ (UIColor*)gradientFromColor:(UIColor*)c1 toColor:(UIColor*)c2 withHeight:(int)height{
    CGSize size = CGSizeMake(1, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray* colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

- (CGFloat)red {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
        return -1.0f;
    }
    CGFloat const *components = CGColorGetComponents(color);
    return components[0];
}


- (CGFloat)green {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
        return -1.0f;
    }
    CGFloat const *components = CGColorGetComponents(color);
    return components[1];
}


- (CGFloat)blue {
    CGColorRef color = self.CGColor;
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color)) != kCGColorSpaceModelRGB) {
        return -1.0f;
    }
    CGFloat const *components = CGColorGetComponents(color);
    return components[2];
}


- (CGFloat)alpha {
    return CGColorGetAlpha(self.CGColor);
}

@end
