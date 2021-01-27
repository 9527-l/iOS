//
//  ZFGetDataFromResponseTool.h
//  ZFZG
//
//  Created by Lee on 2021/1/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFGetDataFromResponseTool : NSObject
+ (NSDictionary *)getData:(id)responseObject;
+ (NSArray *)getDataArr:(id)responseObject;
@end

NS_ASSUME_NONNULL_END
