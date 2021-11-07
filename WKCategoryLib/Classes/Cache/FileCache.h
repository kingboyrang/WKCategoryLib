//
//  FileCache.h
//  Pods
//
//  Created by kingboyrang on 2021/11/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileCache : NSObject

#pragma mark----------- Temp: 文件保存和删除 -------------------
// 保存: 对象二进制数据到临时文件夹 并设置有效期时间（单位：秒）
+ (void)setObject:(NSData *)data forKey:(NSString *)key withExpires:(int)expires;

// 获取: 临时文件夹中的二进制数据文件
+ (NSData *)get:(NSString *)key;

// 删除: 临时文件夹中的文件
+ (BOOL)clear:(NSString *)key;

#pragma mark----------- 计算文件缓存大小 -------------------
// 单个: 文件大小
+ (long long)fileSizeAtPath:(NSString*) filePath;

// 文件夹: 文件大小
+ (float )folderSizeAtPath:(NSString*) folderPath;

@end

NS_ASSUME_NONNULL_END
