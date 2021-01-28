//
//  ZFBusinessListModel.m
//  ZFZG
//
//  Created by Lee on 2021/1/28.
//

#import "ZFBusinessListModel.h"

@implementation ZFBusinessListModel
+ (instancetype)businessListModelWithIconImageName:(NSString *)iconImageName leftStr:(NSString *)leftStr rightStr:(NSString *)rightStr{
    ZFBusinessListModel *model = [[ZFBusinessListModel alloc] init];
    model.iconImageName = iconImageName;
    model.leftStr = leftStr;
    model.rightStr = rightStr;
    return model;
}
@end
