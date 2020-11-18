//
//  ZFMineUserInfoModel.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMineUserInfoModel : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) BOOL isShowArrow;
@end

NS_ASSUME_NONNULL_END
