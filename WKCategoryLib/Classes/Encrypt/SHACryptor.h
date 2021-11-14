//
//  SHACryptor.h
//  Pods
//
//  Created by kingboyrang on 2021/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SHACryptor : NSObject

+ (NSString*)sha1:(NSString *)content;
+ (NSString*)sha256:(NSString *)content;
+ (NSString*)sha512:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
