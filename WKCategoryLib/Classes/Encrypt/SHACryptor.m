//
//  SHACryptor.m
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//

#import "SHACryptor.h"
#import <CommonCrypto/CommonDigest.h>

@implementation SHACryptor

+ (NSString*) sha1:(NSString *)content{
    
    NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    const char *bytes = (char *)[data bytes];
    
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(bytes, (int)strlen(bytes), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString*) sha256:(NSString *)content{
    
    NSData *stringBytes = [content dataUsingEncoding: NSUTF8StringEncoding];
    const char *bytes = (char *)[stringBytes bytes];
    
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(bytes, (int)strlen(bytes), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString*) sha512:(NSString *)content{
     NSData *stringBytes = [content dataUsingEncoding: NSUTF8StringEncoding];
     const char *bytes = (char *)[stringBytes bytes];
    
    unsigned char result[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(bytes, (int)strlen(bytes), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA512_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA512_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
