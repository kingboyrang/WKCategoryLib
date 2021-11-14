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
#import <WKCategoryLib/RSACryptor.h>


#define public_key @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrBuxCpQKNw94mA9rflaZC8IfeTsTPuqBMXDOYl7NkvZtVKu/l7GRbY+pkFzStmKRtoHhpvD/29Uh+lI+cxvjlEHNcce2lfiHompV0WD/WkjXynP94MsZyHPbetU6TfsSMSI9qumsLMYGqV//UPwVdEuS/IU/257u+6lLiF4aB1wIDAQAB"

#define private_key @"MIICXQIBAAKBgQCrBuxCpQKNw94mA9rflaZC8IfeTsTPuqBMXDOYl7NkvZtVKu/l7GRbY+pkFzStmKRtoHhpvD/29Uh+lI+cxvjlEHNcce2lfiHompV0WD/WkjXynP94MsZyHPbetU6TfsSMSI9qumsLMYGqV//UPwVdEuS/IU/257u+6lLiF4aB1wIDAQABAoGAGhCgCTgkv35OaPTFcrXX9PO7gUH39MC4lWqn4mWcTYooFj7I+P2h/duoaUCwIpTU2nBOaa7rALQ5LDFwAbDBVcfvDKJQIjKuGfsTeBR6D4/D4JIkIOnUercdk8UCA2wYKXMmZmzyy7vBC2xWj+3z4fX6OYQNu2seWiQMq0wrpSECQQDYfJD4O1iY4s3sMcwOV4n35Vt45cbvtNMvw5vAVxWfPiUdOhU1boUfcZyTcd+I4iNqzIa33Nru1U+J2F4TUnjbAkEAyj49I3R3RJXSX06PLASydsDyb/MQw2RXyTUIc9g2DZGJ1vXyf7n4AsRPcxmwHEFehGlufFVJ4XrA7HP4kEbdtQJBAMnQPjka4foMnVlOBuNr2fOd/gsTccQutx105fKFfGOqRGEdr33THQj2GbgeVPu/jLLYHdKzcelqM67WZMTwgjcCQQDBmXLNTeAeN416zqkfah+srmdl4zhY0uV2Jt5Ahui3dGqO7EGHI27WtzWW6TA83Bauin7JZpuizO+BakK3Wh9BAkA9x27MRUclPu9y4OcFMXku90a+lotmP4wzwfJ+6JCgRCEu7OfQP0/PEKqvExQBqhwAH7MnstFgtKqlBScotn9u"

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
    
    
    
    //aes,des,3des加解密
    //[self aesTest];
    
    //rsa加解密
    [self rsaTest];
   
}

//aes 加解密
- (void)aesTest{
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

//rsa测试
- (void)rsaTest{
    
    /**
     
     1.在iOS中使用RSA加密解密，需要用到.der,.p12
     (1).der格式的文件存放的是公钥（Public key）用于加密
     (2).p12格式的文件存放的是私钥（Private key）用于解密
     
     2.使用openssl生成所需秘钥文件
     (1)生成模长为1024bit的私钥文件private_key.pem
        openssl genrsa -out private_key.pem 1024
     
     (2)生成证书请求文件rsaCertReq.csr
        openssl req -new -key private_key.pem -out rsaCerReq.csr
        注意：这一步会提示输入国家、省份、mail等信息，可以根据实际情况填写，或者全部不用填写，直接全部敲回车.
     
     (3)生成证书rsaCert.crt,并设置有效时间为1年
        openssl x509 -req -days 3650 -in rsaCerReq.csr -signkey private_key.pem -out rsaCert.crt

     (4)生成供iOS使用的公钥文件public_key.der
        openssl x509 -outform der -in rsaCert.crt -out public_key.der
     
     (5)生成供iOS使用的私钥文件private_key.p12
        openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt
        注意：这一步会提示给私钥文件设置密码，直接输入想要设置密码即可，然后敲回车，然后再验证刚才设置的密码，再次输入密码，然后敲回车，完毕！
     
     (6)生成供Java使用的公钥rsa_public_key.pem
        openssl rsa -in private_key.pem -out rsa_public_key.pem -pubout
     
     (7)生成供Java使用的私钥pkcs8_private_key.pem
        openssl pkcs8 -topk8 -in private_key.pem -out pkcs8_private_key.pem -nocrypt
     
     3.所需使用的文件
     
     全部执行成功后，会生成如下文件，其中public_key.der和private_key.p12就是iOS需要用到的文件
     全部执行成功后，会生成如下文件，其中rsa_public_key.pem和pkcs8_private_key.pem就是java需要用到的文件
     
     */
    
    NSString *bodyJson = @"{\"name\":\"kingboyrang\",\"sex\":\"男\"}";
    NSString *pubPath=[[NSBundle mainBundle] pathForResource:@"public_key" ofType:@"der"];
    NSString *encryStr= [RSACryptor encryptString:bodyJson publicKeyWithContentsOfFile:pubPath];
    NSLog(@"rsa加密后的字符串:%@",encryStr);
    
    NSString *privatePath=[[NSBundle mainBundle] pathForResource:@"private_key" ofType:@"p12"];
    NSString *decstring=[RSACryptor decryptString:encryStr privateKeyWithContentsOfFile:privatePath password:@"123456"];
    NSLog(@"rsa解密结果:%@", decstring);
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
