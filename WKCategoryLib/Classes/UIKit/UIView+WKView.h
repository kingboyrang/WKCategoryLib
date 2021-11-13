//
//  UIView+WKView.h
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE

@interface UIView (WKView)

@property (nonatomic, assign)CGFloat x;
@property (nonatomic, assign)CGFloat y;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat centerX;
@property (nonatomic, assign)CGFloat centerY;
@property (nonatomic, assign)CGSize size;
@property(nonatomic, assign) IBInspectable CGFloat borderWidth;
@property(nonatomic, assign) IBInspectable UIColor *borderColor;
@property(nonatomic, assign) IBInspectable CGFloat cornerRadius;

/**
 *  水平居中
 */
- (void)alignHorizontal;
/**
 *  垂直居中
 */
- (void)alignVertical;
/**
 *  判断是否显示在主窗口上面
 *
 *  @return 是否
 */
- (BOOL)isShowOnWindow;

- (UIViewController *)parentController;


//View截图
- (UIImage*) screenshot;

//ScrollView截图 contentOffset
- (UIImage*) screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

//View按Rect截图
- (UIImage*) screenshotInFrame:(CGRect)frame;

//整个view转成图片
- (UIImage*) convertToImage;

//左右抖动动画
- (void) shakeAnimation;

//旋转180度
- (void) trans180DegreeAnimation;

@end

NS_ASSUME_NONNULL_END
