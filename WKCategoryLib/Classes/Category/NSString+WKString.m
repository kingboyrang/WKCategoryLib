//
//  NSString+WKString.m
//  Pods
//
//  Created by kingboyrang on 2021/11/6.
//

#import "NSString+WKString.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (WKString)

/**
 *  生成guid值
 *
 *  @return 返回guid值
 */
+ (NSString*)createGUID{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}

/**
 *  字符串md5加密
 *
 *  @return md5字符串
 */
- (NSString*) stringFromMD5{
    const char *cStr = [self UTF8String];
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

/**
 *  字符串去前后空格
 *
 *  @return 返回去空格后的内容
 */
- (NSString*)Trim {
    if (self&&[self length]>0) {
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"";
}

/**
 *  字符串去所有空格
 *
 *  @return 返回去空格后的内容
 */
- (NSString*)TrimAll {
    if (self&&[self length]>0) {
        return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return @"";
}

/**
 *  @brief  判断字符串是否为空
 *
 *
 *  @return YES表示字符串为空，NO表示字符串不为空
 */
- (BOOL)isEmpty{
    if ([[self Trim] length]>0) {
        return NO;
    }
    return YES;
}

/**
 *  url字符串编码处理
 *
 *  @return  url编码字符串
 */
- (NSString*)URLEncode {
    
    NSString *charactersToEscape = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| ";
    NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
    NSString *encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
    return encodedString;
}

/**
 *  url字符串解码处理
 *
 *  @return url解码字符串
 */
- (NSString *)URLDecoded {
    
    return [self stringByRemovingPercentEncoding];
    //return ( NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,(CFStringRef)self,CFSTR(""),kCFStringEncodingUTF8));
}

/**
 *  @brief  取得text大小
 *
 *  @param  f   文本字体
 *  @param  w   文本显示的最大宽度
 *  @return 返回文本大小
 */
- (CGSize)textSize:(UIFont*)f withWidth:(CGFloat)w{
    #if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
        NSDictionary *attr = @{NSFontAttributeName:f};
        CGRect rect = [self boundingRectWithSize:CGSizeMake(w, CGFLOAT_MAX)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attr
                                        context:nil];
        return  rect.size;
    #else
        return  [self sizeWithFont:f constrainedToSize:CGSizeMake(w, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    #endif
}

/**
*  @brief  判断是否为整形
*
*  @return YES表示整型，NO不是整型
*/
- (BOOL)isInterger {
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

/**
*  @brief  判断是否为浮点形
*
*  @return YES表示是，NO不是
*/
- (BOOL)isFloat {
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

/**
*  @brief  判断是否为数字
*
*  @return YES表示是，NO不是
*/
- (BOOL)isNumber {
    if ([self isEmpty]) {
        return NO;
    }
    if( ![self isInterger] || ![self isFloat]){
        return NO;
    }
    return YES;
}

/**
 *  判断是否为字母与数字组成
 *
 *  @return 是为YES,否则为NO
 */
- (BOOL)isLetterAndNumber{
    if (![self isKindOfClass:[NSNull class]]&&self&&[[self Trim] length]>0) {
        NSString *regex = @"^[A-Za-z0-9]+$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        return [pred evaluateWithObject:[self Trim]];
    }
    return NO;
}

@end