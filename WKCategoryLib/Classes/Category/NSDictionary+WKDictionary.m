//
//  NSDictionary+WKDictionary.m
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//

#import "NSDictionary+WKDictionary.h"


@implementation NSDictionary (WKDictionary)

/**
* json字符串转字典
* @param  jsonString json字符串
* @return 返回字典
*/
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    if(err) {
        #ifdef DEBUG
                NSLog(@"fail to get dictioanry from JSON: %@, error: %@", jsonString, err);
        #endif
        return nil;
    }
    return dic;
}

/**
*  字典转json字符串
*  @return 返回json字符串
*/
- (NSString *)toJSONString{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        //NSLog(@"%@",error);
        #ifdef DEBUG
                NSLog(@"fail to get JSON from dictionary: %@, error: %@", self, error);
        #endif
        return nil;
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}


@end
