//
//  ZFBusinessListModel.h
//  ZFZG
//
//  Created by Lee on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFBusinessListModel : NSObject
@property (nonatomic, copy) NSString *iconImageName;
@property (nonatomic, copy) NSString *leftStr;
@property (nonatomic, copy) NSString *rightStr;

+ (instancetype)businessListModelWithIconImageName:(NSString *)iconImageName leftStr:(NSString *)leftStr rightStr:(NSString *)rightStr;
@end

NS_ASSUME_NONNULL_END
