//
//  ZFQueryInListModel.m
//  ZFZG
//
//  Created by Lee on 2021/1/27.
//

#import "ZFQueryInListModel.h"

@implementation RawDataModel


@end

@implementation ZFQueryInListModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"id"  : @"ID"};
}
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"raw_data" : [RawDataModel class]};
}


@end
