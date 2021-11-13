//
//  UIAlertController+WKAlertController.m
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//

#import "UIAlertController+WKAlertController.h"


@implementation UIAlertController (WKAlertController)

/**
* 弹框
* @param viewController 弹出的viewController
* @param title          弹框标题
* @param message        弹框内容
* @param style          弹框类型
* @param titles         弹框按钮
* @param handlerBlock   弹框按钮事件
*/
+ (void)showAlterController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message style:(UIAlertControllerStyle)style actionTitles:(NSArray <NSString *>*)titles handler:(void(^)(NSInteger index))handlerBlock{
    // 1. 创建alert控制器并指定style：UIAlertControllerStyleAlert｜｜UIAlertControllerStyleActionSheet 本文以   Alert为例展示

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    // 2. 添加选项
    if (titles && [titles count]>0) {
        [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            UIAlertActionStyle actionStyle = UIAlertActionStyleDefault;
            if ([obj isEqualToString:@"取消"] || [obj isEqualToString:@"cancle"]) {
                actionStyle = UIAlertActionStyleCancel;
            }
            [alertController addAction: [UIAlertAction actionWithTitle:obj style:actionStyle handler:^(UIAlertAction *action) {
                if (handlerBlock) {
                    handlerBlock(idx);
                }
            }]];
            
        }];
    }
    // 3. 模态退出控制器
    //BOOL animated = style == UIAlertControllerStyleAlert?YES:NO;
    [viewController presentViewController:alertController animated:YES completion:nil];
}

@end
