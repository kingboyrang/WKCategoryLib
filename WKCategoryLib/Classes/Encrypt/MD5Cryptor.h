//
//  MD5Cryptor.h
//  Pods
//
//  Created by kingboyrang on 2021/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MD5Cryptor : NSObject

/**
*  md5加密方法
*
*  @param str   需要加密的字符串
*  @return      返回加密后的字串符
*/
+ (NSString *)md5:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
