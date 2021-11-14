//
//  MD5Cryptor.m
//  Pods
//
//  Created by kingboyrang on 2021/11/14.
//

#import "MD5Cryptor.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation MD5Cryptor

/**
*  md5加密方法
*
*  @param str   需要加密的字符串
*  @return      返回加密后的字串符
*/
+ (NSString *)md5:(NSString *)str{
    
    if (!str) {
        return nil;
    }
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}

@end
