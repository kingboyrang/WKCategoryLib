//
//  NSString+WKString.h
//  Pods
//
//  Created by kingboyrang on 2021/11/6.
//

#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (WKString)

/**
 *  生成guid值
 *
 *  @return 返回guid值
 */
+ (instancetype)createGUID;

/**
 * 随机字符串
 * @param number  需要的个数
 * @return 生成的字符串
 */
+ (instancetype)randomString:(NSInteger)number;

/**
 * 随机字符串
 * @param letters  指定随机字符串
 * @param number   需要的个数
 * @return 生成的字符串
 */
+ (instancetype)randomString:(NSString*)letters length:(NSInteger)number;

/**
 *  字符串md5加密
 *
 *  @return md5字符串
 */
- (NSString*) stringFromMD5;
/**
 *  字符串去前后空格
 *
 *  @return 返回去空格后的内容
 */
- (NSString*)Trim;

/**
 *  字符串去所有空格
 *
 *  @return 返回去空格后的内容
 */
- (NSString*)TrimAll;

/**
 *  @brief  判断字符串是否为空
 *
 *  @return YES表示字符串为空，NO表示字符串不为空
 */
- (BOOL)isEmpty;
/**
 *  url字符串编码处理
 *
 *  @return  url编码字符串
 */
- (NSString*)URLEncode;
/**
 *  url字符串解码处理
 *
 *  @return url解码字符串
 */
- (NSString *)URLDecoded;

/**
 *  @brief  url query转成NSDictionary
 *
 *  @return NSDictionary
 */
- (NSDictionary *)dictionaryFromURLParameters;

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
 *  @brief 计算文字的大小
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
/**
 *  @brief 计算文字的大小
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGSize)sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

/**
*  @brief  判断是否为整形
*
*  @return YES表示整型，NO不是整型
*/
- (BOOL)isInterger;

/**
*  @brief  判断是否为浮点形
*
*  @return YES表示是，NO不是
*/
- (BOOL)isFloat;

/**
*  @brief  判断是否为数字
*
*  @return YES表示是，NO不是
*/
- (BOOL)isNumber;

/**
 *  判断是否为字母与数字组成
 *
 *  @return 是为YES,否则为NO
 */
- (BOOL)isLetterAndNumber;

/**
 *  @brief  正则验证
 *  @param  express 正则表达式(如email验证：@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
 *  @return 成功为YES,否则为NO
 */
- (BOOL)regularValidateWithExpress:(NSString *)express;

/**
 通过时间戳计算时间差（几小时前、几天前
 @param compareDate 时间戳
 @return 时间显示
 */
+ (NSString *) compareCurrentTime:(NSTimeInterval) compareDate;

/**
 通过时间戳得出对应的时间
 @param timestamp 时间戳
 @return 时间显示
 */
+ (NSString *) getDateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 //通过时间戳和显示时间
 @param timestamp 时间戳
 @param formatter 格式
 @return 时间显示
 */
+ (NSString *) getStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;

@end

NS_ASSUME_NONNULL_END
