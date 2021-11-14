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
#import <WKCategoryLib/AESCryptor.h>

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
    
    
    
       //aes加解密key
       NSString *appkey = @"UxCn6hNCtvYOB%ED";
       
       //NSString *ivkey = @"123456";
       //NSData *ivData = [ivkey dataUsingEncoding:NSUTF8StringEncoding];
       
       //要加密的字典
       NSDictionary *body = @{
                              @"v":@"1.0.0",
                              @"agentCode":@"zte001",
                              @"pv":@"iphone",
                              @"uid":@"1"};
       
       //1.aes,des,3des加密
       //NSString *encryStr= [AESCryptor encryptWithAESContent:body key:appkey iv:nil];
       //NSString *encryStr= [AESCryptor encryptWithDESContent:body key:appkey iv:nil];
       NSString *encryStr= [AESCryptor encryptWith3DESContent:body key:appkey iv:nil];
       NSLog(@"aes,des,3des加密后的字符串:%@",encryStr);
       
       //2.aes,des,3des解密
      //NSString *decstring=[AESCryptor decryptWithAESContent:[encryStr dataUsingEncoding:NSUTF8StringEncoding] key:appkey iv:nil];
      //NSString *decstring=[AESCryptor decryptWithDESContent:[encryStr dataUsingEncoding:NSUTF8StringEncoding] key:appkey iv:nil];
      NSString *decstring=[AESCryptor decryptedWith3DESContent:[encryStr dataUsingEncoding:NSUTF8StringEncoding] key:appkey iv:nil];
       NSLog(@"aes,des,3des解密结果:%@", decstring);
    
   
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
