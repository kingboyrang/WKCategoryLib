//
//  AESCryptor.m
//  Pods
//
//  Created by kingboyrang on 2021/11/14.
//

#import "AESCryptor.h"
#import "NSData+WKBase64.h"
#import <CommonCrypto/CommonCryptor.h>


static void jk_FixKeyLengths(CCAlgorithm algorithm, NSMutableData * keyData, NSMutableData * ivData)
{
    NSUInteger keyLength = [keyData length];
    switch ( algorithm )
    {
        case kCCAlgorithmAES128:
        {
            if (keyLength <= 16)
            {
                [keyData setLength:16];
            }
            else if (keyLength>16 && keyLength <= 24)
            {
                [keyData setLength:24];
            }
            else
            {
                [keyData setLength:32];
            }
            
            break;
        }
            
        case kCCAlgorithmDES:
        {
            [keyData setLength:8];
            break;
        }
            
        case kCCAlgorithm3DES:
        {
            [keyData setLength:24];
            break;
        }
            
        case kCCAlgorithmCAST:
        {
            if (keyLength <5)
            {
                [keyData setLength:5];
            }
            else if ( keyLength > 16)
            {
                [keyData setLength:16];
            }
            
            break;
        }
            
        case kCCAlgorithmRC4:
        {
            if ( keyLength > 512)
                [keyData setLength:512];
            break;
        }
            
        default:
            break;
    }
    
    [ivData setLength:[keyData length]];
}

@implementation AESCryptor

/**
*  利用AES加密数据
*
*  @param content  加密内容
*  @param key      key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
*  @param iv       iv description(可以为nil)
*
*  @return 返回加密后的字串符(base64字符串)
*/
+ (NSString *)encryptWithAESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
        return nil;
    }
    NSData *encryptData = [self jk_CCCryptData:bodyData algorithm:kCCAlgorithmAES128 operation:kCCEncrypt key:key iv:iv];
    
    return [encryptData base64EncodedString];
}

/**
 *  @brief  利用AES解密据
 *
 *  @param content  加密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
+ (NSString *)decryptWithAESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
        return nil;
    }
    NSData *decryptData = [self jk_CCCryptData:[NSData dataWithBase64EncodedString:bodyData] algorithm:kCCAlgorithmAES128 operation:kCCDecrypt key:key iv:iv];
    
    NSString *decryptedString = [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
    return decryptedString;
}

/**
 *  利用DES加密数据
 *
 *  @param content  加密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)encryptWithDESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
        return nil;
    }
    NSData *encryptData = [self jk_CCCryptData:bodyData algorithm:kCCAlgorithmDES operation:kCCEncrypt key:key iv:iv];
    return [encryptData base64EncodedString];
}

/**
 *  利用DES解密数据
 *
 *  @param content  解密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)decryptWithDESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
        return nil;
    }
    NSData *decryptData= [self jk_CCCryptData:[NSData dataWithBase64EncodedString:bodyData] algorithm:kCCAlgorithmDES operation:kCCDecrypt key:key iv:iv];
    return [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
}

/**
 *  利用3DES加密数据
 *
 *  @param content  加密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为24
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)encryptWith3DESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
        return nil;
    }
    NSData *encryptData = [self jk_CCCryptData:bodyData algorithm:kCCAlgorithm3DES operation:kCCEncrypt key:key iv:iv];
    return [encryptData base64EncodedString];
}

/**
 *  @brief   利用3DES解密数据
 *
 *  @param content  解密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
+ (NSString *)decryptedWith3DESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv{
    NSData *bodyData = [self getContentData:content];
    if (bodyData == nil) {
       return nil;
    }
    NSData *decryptData= [self jk_CCCryptData:[NSData dataWithBase64EncodedString:bodyData] algorithm:kCCAlgorithm3DES operation:kCCDecrypt key:key iv:iv];
    return [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
}


+ (NSData *)jk_CCCryptData:(NSData *)data
              algorithm:(CCAlgorithm)algorithm
              operation:(CCOperation)operation
                    key:(NSString *)key
                     iv:(NSData *)iv {
    NSMutableData *keyData = [[key dataUsingEncoding:NSUTF8StringEncoding] mutableCopy];
    NSMutableData *ivData = [iv mutableCopy];
    
    size_t dataMoved;
    
    int size = 0;
    if (algorithm == kCCAlgorithmAES128 ||algorithm == kCCAlgorithmAES) {
        size = kCCBlockSizeAES128;
    }else if (algorithm == kCCAlgorithmDES) {
        size = kCCBlockSizeDES;
    }else if (algorithm == kCCAlgorithm3DES) {
        size = kCCBlockSize3DES;
    }if (algorithm == kCCAlgorithmCAST) {
        size = kCCBlockSizeCAST;
    }
    
    NSMutableData *decryptedData = [NSMutableData dataWithLength:data.length + size];
    
    int option = kCCOptionPKCS7Padding | kCCOptionECBMode;
    if (iv) {
        option = kCCOptionPKCS7Padding;
    }
    jk_FixKeyLengths(algorithm, keyData,ivData);
    CCCryptorStatus result = CCCrypt(operation,                    // kCCEncrypt or kCCDecrypt
                                     algorithm,
                                     option,                        // Padding option for CBC Mode
                                     keyData.bytes,
                                     keyData.length,
                                     iv.bytes,
                                     data.bytes,
                                     data.length,
                                     decryptedData.mutableBytes,    // encrypted data out
                                     decryptedData.length,
                                     &dataMoved);                   // total data moved
    
    if (result == kCCSuccess) {
        decryptedData.length = dataMoved;
        return decryptedData;
    }
    return nil;
}

+ (NSData *)getContentData:(id)content{
    if (content == nil) {
        return nil;
    }
    NSData *bodyData = nil;
    if ([content isKindOfClass:[NSString class]]) {
        bodyData = [(NSString*)content dataUsingEncoding:NSUTF8StringEncoding];
    }else if ([content isKindOfClass:[NSData class]]){
        bodyData = (NSData *)content;
    }else if ([content isKindOfClass:[NSDictionary class]]){
        bodyData = [NSJSONSerialization dataWithJSONObject:content options:NSJSONWritingPrettyPrinted error:nil];
    }
    return bodyData;
    
}

@end
