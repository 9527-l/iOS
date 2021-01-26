//
//  ZFSaveValueTool.m
//  ZFZG
//
//  Created by Lee on 2021/1/26.
//

#import "ZFSaveValueTool.h"

@implementation ZFSaveValueTool
+(void)saveDefaults:(NSString *)key Value:(id)value{
    if (![NSObject isBlank:key] && ![NSObject isBlank:value]) {
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults setObject:value forKey:key];
        [userDefaults synchronize];
    }
}
+(void)removeDefaults:(NSString *)key{
    if (![NSObject isBlank:key]) {
        NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:key];
    }
    
}
+(NSString *)getToken{
    id token = [ZFSaveValueTool getDefaults:auth_token];
    NSString *tokenStr = nil;
    if (![NSObject isBlank:token]) {
        tokenStr = [NSString stringWithFormat:@"%@", token];
    }
    return tokenStr;
}
+(NSString *)getAuthToken{
    id token = [ZFSaveValueTool getDefaults:refresh_token];
    NSString *tokenStr = nil;
    if (![NSObject isBlank:token]) {
        tokenStr = [NSString stringWithFormat:@"%@", token];
    }
    return tokenStr;
}
+(id)getDefaults:(NSString *)key{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    id obj = nil;
    if (![NSObject isBlank:key]) {
        obj=[userDefaults objectForKey:key];
    }
    return obj;
}

+(void)userLoginOut{
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:auth_token];
    [userDefaults removeObjectForKey:refresh_token];
}
@end
