//
//  ZFQueryInListModel.h
//  ZFZG
//
//  Created by Lee on 2021/1/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RawDataModel : NSObject
@property (copy, nonatomic) NSString *merCode;
@property (copy, nonatomic) NSString *bizMsg;
@property (copy, nonatomic) NSString *bizCode;
@property (copy, nonatomic) NSString *SDKPushKey;
@property (copy, nonatomic) NSString *source;
@property (copy, nonatomic) NSString *terminals;
@property (copy, nonatomic) NSString *merchantName;

@end


@interface ZFQueryInListModel : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *outer_mer_id;
@property (copy, nonatomic) NSString *outer_mer_name;
@property (copy, nonatomic) NSString *outer_device_no;
@property (copy, nonatomic) NSString *error_msg;
@property (copy, nonatomic) NSString *uid;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *created_at;
@property (copy, nonatomic) NSString *updated_at;
@property (copy, nonatomic) NSString *editable;

@property (strong, nonatomic) RawDataModel *raw_data;
@end


NS_ASSUME_NONNULL_END
