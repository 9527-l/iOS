//
//  ZFBusinessInfoModel.m
//  ZFZG
//
//  Created by Lee on 2021/1/28.
//

#import "ZFBusinessInfoModel.h"

@implementation TypeModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"id"  : @"ID"};
}

@end

@implementation ZFBusinessInfoModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"type" : [TypeModel class]};
}

@end
