//
//  UIAlertController+WKAlertController.h
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (WKAlertController)

/**
* 弹框
* @param viewController 弹出的viewController
* @param title          弹框标题
* @param message        弹框内容
* @param style          弹框类型(UIAlertControllerStyleAlert｜UIAlertControllerStyleActionSheet)
* @param titles         弹框按钮
* @param handlerBlock   弹框按钮事件
*/
+ (void)showAlterController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style actionTitles:(NSArray <NSString *>*)titles handler:(void(^)(NSInteger index))handlerBlock;

@end

NS_ASSUME_NONNULL_END
