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

@interface WKViewController ()

@end

@implementation WKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *str=@"123456";
    
    NSLog(@"uuid=%@",[NSString createGUID]);
    NSLog(@"md5=%@",[str stringFromMD5]);
    
    
    NSDate *nowDate = [NSDate date];
    NSLog(@"取得今天是星期几=%ld",(long)[nowDate dayOfWeek]);
    NSLog(@"取得每月有多少天=%ld",(long)[nowDate monthOfDay]);
    NSLog(@"日期格式化成字符串=%@",[nowDate stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]);
    
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width - 200, 100)];
    //colorView.backgroundColor = [UIColor colorWithHexStr:@"ff9ab00"];
    colorView.backgroundColor = UIColorMakeRGB(235, 40, 160);
    [self.view addSubview:colorView];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
