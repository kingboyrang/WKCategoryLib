//
//  NSDictionary+WKDictionary.h
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (WKDictionary)

/**
* json字符串转字典
* @param   jsonString json字符串
* @return  返回字典
*/
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
*  字典转json字符串
*  @return 返回json字符串
*/
- (NSString *)toJSONString;

@end

NS_ASSUME_NONNULL_END
