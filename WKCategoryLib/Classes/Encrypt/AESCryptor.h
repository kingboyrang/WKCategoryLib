//
//  AESCryptor.h
//  Pods
//
//  Created by kingboyrang on 2021/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AESCryptor : NSObject

/**
*  @brief 利用AES加密数据
*
*  @param content  加密内容(NSString或NSData或者NSDictionary)
*  @param key      key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
*  @param iv       iv description(可以为nil)
*
*  @return 返回加密后的字串符(base64字符串)
*/
+ (NSString *)encryptWithAESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;

/**
 *  @brief  利用AES解密据
 *
 *  @param content  解密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
+ (NSString *)decryptWithAESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;

/**
 *  利用DES加密数据
 *
 *  @param content  加密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)encryptWithDESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;

/**
 *  利用DES解密数据
 *
 *  @param content  解密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)decryptWithDESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;


/**
 *  利用3DES加密数据
 *
 *  @param content  加密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为24
 *  @param iv  iv description
 *
 *  @return data
 */
+ (NSString *)encryptWith3DESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;

/**
 *  @brief   利用3DES解密数据
 *
 *  @param content  解密内容(NSString或NSData或者NSDictionary)
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
+ (NSString *)decryptedWith3DESContent:(id)content key:(NSString*)key iv:(NSData * __nullable)iv;

@end

NS_ASSUME_NONNULL_END
