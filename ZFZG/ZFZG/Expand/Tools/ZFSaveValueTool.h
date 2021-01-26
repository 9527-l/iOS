//
//  ZFSaveValueTool.h
//  ZFZG
//
//  Created by Lee on 2021/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFSaveValueTool : NSObject
+(void)saveDefaults:(NSString *)key Value:(id)value;
+(void)removeDefaults:(NSString *)key;
+(id)getDefaults:(NSString *)key;
+(NSString *)getToken;
+(NSString *)getAuthToken;
+(void)userLoginOut;
@end

NS_ASSUME_NONNULL_END
