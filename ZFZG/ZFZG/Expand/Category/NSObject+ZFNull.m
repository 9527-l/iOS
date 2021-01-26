//
//  NSObject+ZFNull.m
//  ZFZG
//
//  Created by Lee on 2021/1/26.
//

#import "NSObject+ZFNull.h"

@implementation NSObject (ZFNull)
+ (BOOL)isBlank:(id)object{
    if (object == nil || [object isEqual:[NSNull null]] || object == NULL) {
            return YES;
        } else if ([object isKindOfClass:[NSString class]]) {
            return [object isEqualToString:@""];
        } else if ([object isKindOfClass:[NSNumber class]]) {
            return [object isEqualToNumber:@(0)];
        }else if ([object isKindOfClass:[NSArray class]]){
            return [object isEqualToArray:@[]];
        }else if ([object isKindOfClass:[NSDictionary class]]){
            return [object isEqualToArray:@{}];
        }
        return NO;


}
@end
