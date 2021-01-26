//
//  ZFGetDataFromResponseTool.m
//  ZFZG
//
//  Created by Lee on 2021/1/27.
//

#import "ZFGetDataFromResponseTool.h"

@implementation ZFGetDataFromResponseTool
+ (NSDictionary *)getData:(id)responseObject{
    NSDictionary *dict = [NSDictionary dictionary];
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        dict = (NSDictionary *)responseObject[@"data"];
    }
    return dict;
}
@end
