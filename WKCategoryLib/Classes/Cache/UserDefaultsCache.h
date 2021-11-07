//
//  UserDefaultsCache.h
//  Pods
//
//  Created by kingboyrang on 2021/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserDefaultsCache : NSObject

/**
 *  删除缓存值
 *
 *  @param key 缓存key
 */
+ (void)removeForKey:(NSString*)key;

/**
 *  设置缓存值
 *
 *  @param object 缓存值
 *  @param key    缓存key
 */
+ (void)setValue:(id)object  forKey:(NSString*)key;

/**
 *  设置缓存值
 *
 *  @param boo    缓存值
 *  @param key    缓存key
 */
+ (void)setBool:(BOOL)boo  forKey:(NSString*)key;

/**
 *  设置缓存值(缓存值序列化)
 *
 *  @param object 缓存值
 *  @param key    缓存key
 */
+ (void)setValueArchiver:(id)object forKey:(NSString *)key;

/**
 *  取得缓存值
 *
 *  @param key 缓存key
 *
 *  @return 取得缓存值
 */
+ (id)valueForKey:(NSString*)key;

/**
 *  取得缓存值
 *
 *  @param key 缓存key
 *
 *  @return 取得缓存值
 */
+ (NSString*)stringValueForKey:(NSString*)key;

/**
 *  取得缓存值
 *
 *  @param key 缓存key
 *
 *  @return 取得缓存值
 */
+ (BOOL)boolValueForKey:(NSString*)key;

/**
 *  取得缓存值(缓存值反序列化)
 *
 *  @param key 缓存key
 *
 *  @return 取得缓存值(缓存值反序列化)
 */
+ (id)unarchiveValueForKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
