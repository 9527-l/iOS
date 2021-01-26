//
//  NSObject+ZFNull.h
//  ZFZG
//
//  Created by Lee on 2021/1/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZFNull)
///判断自己是否为空
+ (BOOL)isBlank:(id)object;
@end

NS_ASSUME_NONNULL_END
