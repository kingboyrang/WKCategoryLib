//
//  UIImage+WKImage.h
//  Pods
//
//  Created by kingboyrang on 2021/11/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (WKImage)

/**
 *  裁剪图片
 *
 *  @param rect 裁剪范围
 *
 *  @return  裁剪后图片
 */
- (UIImage *)imageAtRect:(CGRect)rect;
/**
 *  图像比例缩放到最小大小
 *
 *  @param targetSize 图片大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
/**
 *  图像比例缩放大小
 *
 *  @param targetSize 图片大小
 *
 *  @return 图像比例缩放
 */
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
/**
 *  图片旋转弧度
 *
 *  @param radians 弧度
 *
 *  @return 图片旋转
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
/**
 *  图片旋转角度
 *
 *  @param degrees 角度
 *
 *  @return 图片旋转角度
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
/**
 *  合并两张图片
 *
 *  @param img    合并图1
 *  @param merger 合并图2
 *  @param pos    合并开始位值
 *
 *  @return 合并后的图片
 */
+ (UIImage*)mergerImage:(UIImage*)img mergerImage:(UIImage*)merger position:(CGPoint)pos;
/**
 *  根据颜色生成图片
 *
 *  @param color 图片颜色
 *
 *  @return 生成图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color;
/**
 *  根据颜色生成图片
 *
 *  @param color 图片颜色
 *  @param size  图片大小
 *
 *  @return 生成图片
 */
+ (UIImage*)createImageWithColor:(UIColor*)color imageSize:(CGSize)size;
/**
 *  生成圆角图片
 *
 *  @param image 要生成的圆角图
 *  @param size  圆角大小
 *  @param r     圆角半径
 *
 *  @return 圆角图片
 */
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
/**
 *  根据URL下载图片
 *
 *  @param url 图片URL
 *
 *  @return 返回图片
 */
+ (UIImage*)imageWithContentsOfURL:(NSURL*)url;
/**
 *  根据图片名取得本地资源图片
 *
 *  @param pathCompontent 图片名称
 *
 *  @return 取得本地资源图片
 */
+ (UIImage*)imageWithResourcesPathCompontent:(NSString*)pathCompontent;
/**
 *  Scales the image to the given size, NOT aspect 等比缩放圖片
 *
 *  @param size 图片尺寸
 *
 *  @return 缩放后图片
 */
- (UIImage*)scaleToSize:(CGSize)size;

/*
 * Aspect scale with border color, and corner radius, and shadow
 */
- (UIImage*)aspectScaleToMaxSize:(CGFloat)size withBorderSize:(CGFloat)borderSize borderColor:(UIColor*)aColor cornerRadius:(CGFloat)aRadius shadowOffset:(CGSize)aOffset shadowBlurRadius:(CGFloat)aBlurRadius shadowColor:(UIColor*)aShadowColor;
/**
 *  图片缩放带有阴影
 *
 *  @param size    图片尺寸
 *  @param aOffset 阴影偏移值
 *  @param aRadius 圆角半径
 *  @param aColor  阴影颜色
 *
 *  @return 缩放带有阴影图片
 */
- (UIImage*)aspectScaleToMaxSize:(CGFloat)size withShadowOffset:(CGSize)aOffset blurRadius:(CGFloat)aRadius color:(UIColor*)aColor;

/**
 *  图片缩放带有圆角
 *
 *  @param size    图片尺寸
 *  @param aRadius 圆角半径
 *
 *  @return        缩放图片
 */
- (UIImage*)aspectScaleToMaxSize:(CGFloat)size withCornerRadius:(CGFloat)aRadius;
/**
 *  图片缩放到最大大小
 *
 *  @param size 最大图片尺寸
 *
 *  @return 返回缩放图片
 */
- (UIImage*)aspectScaleToMaxSize:(CGFloat)size;
/**
 *  图片缩放到指定大小
 *
 *  @param size 图片尺寸
 *
 *  @return     返回缩放图片
 */
- (UIImage*)aspectScaleToSize:(CGSize)size;
/**
 *  根据view来生成图片
 *
 *  @param view 要生成图片的view
 *
 *  @return 根据view来生成图片
 */
+ (UIImage *)getImageFromView:(UIView *)view;
/**
 *  创建渐变图片
 *
 *  @param colors    颜色值列表
 *  @param imageSize 图片大小
 *
 *  @return 返回渐变图片
 */
+ (UIImage*)imageMaskGradient:(NSArray*)colors imageSize:(CGSize)imageSize;
/**
 *  Masks the context with the image, then fills with the color
 *
 *  @param rect   图片范围大小
 *  @param aColor 颜色
 */
- (void)drawInRect:(CGRect)rect withAlphaMaskColor:(UIColor*)aColor;
/**
 *  Masks the context with the image, then fills with the gradient (two colors in an array)
 *
 *  @param rect   图片范围大小
 *  @param colors 颜色值列表
 */
- (void)drawInRect:(CGRect)rect withAlphaMaskGradient:(NSArray*)colors;
/**
 *  图片保存
 *
 *  @param path 保存图径
 *
 *  @return     保存是否成功
 */
- (BOOL)saveImage:(NSString*)path;
/**
 *  图片保存
 *
 *  @param path     保存图径
 *  @param fileName 文件名
 *
 *  @return 保存是否成功
 */
- (BOOL)saveImage:(NSString*)path withName:(NSString*)fileName;

@end

NS_ASSUME_NONNULL_END
