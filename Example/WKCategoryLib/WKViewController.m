//
//  WKViewController.m
//  WKCategoryLib
//
//  Created by wuchaorang.2008@163.com on 11/06/2021.
//  Copyright (c) 2021 wuchaorang.2008@163.com. All rights reserved.
//

#import "WKViewController.h"
#import <WKCategoryLib/NSString+WKString.h>
#import <WKCategoryLib/NSDate+WKDate.h>
#import <WKCategoryLib/UIColor+WKColor.h>
#import <WKCategoryLib/UIAlertController+WKAlertController.h>

@interface WKViewController ()

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //pod 制作教程
    //https://www.jianshu.com/p/db158239f3a4
    
    //常用分类
    //https://gitee.com/git_China_/ProductCategory/tree/master/%E5%BF%85%E7%94%A8%E5%88%86%E7%B1%BB
    
    NSString *str=@"123456";
    
    NSLog(@"uuid=%@",[NSString createGUID]);
    NSLog(@"md5=%@",[str stringFromMD5]);
    NSLog(@"随机字符串=%@",[NSString randomString:6]);
    
    
    NSDate *nowDate = [NSDate date];
    NSLog(@"获取当前时间戳(毫秒)=%@",[NSDate getNowTimestampMilliSecondStr]);
    NSLog(@"取得今天是星期几=%ld",(long)[nowDate dayOfWeek]);
    NSLog(@"取得每月有多少天=%ld",(long)[nowDate monthOfDay]);
    NSLog(@"日期格式化成字符串=%@",[nowDate stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]);
    
    NSDate *toDate = [NSDate dateFromString:@"2021-11-10 12:00:12" withFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSInteger days = [NSDate numberOfDaysWithFromDate:toDate toDate:nowDate];
    NSLog(@"日期相差多少天=%ld",(long)days);
    
    //UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width - 200, 100)];
    //colorView.backgroundColor = [UIColor colorWithHexStr:@"ff9ab00"];
    //colorView.backgroundColor = UIColorMakeRGB(235, 40, 160);
    //[self.view addSubview:colorView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//弹框
- (IBAction)tkclick:(id)sender {
    
    [UIAlertController showAlterController:self title:@"提示" message:@"确认是否删除?" style:UIAlertControllerStyleAlert actionTitles:[NSArray arrayWithObjects:@"确认",@"取消", nil] handler:^(NSInteger index) {
        NSLog(@"index = %ld",(long)index);
    }];
    
}
@end
