//
//  ZFBusinessInfoModel.h
//  ZFZG
//
//  Created by Lee on 2021/1/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TypeModel : NSObject
@property (copy, nonatomic) NSString *ID;
@property (assign, nonatomic) NSInteger name;

@end

@interface ZFBusinessInfoModel : NSObject
@property (copy, nonatomic) NSString *outer_mer_name;
@property (assign, nonatomic) NSInteger uid;
@property (assign, nonatomic) NSInteger posm_type;
@property (copy, nonatomic) NSString *class_type;
@property (copy, nonatomic) NSString *sign_fee;
@property (copy, nonatomic) NSString *withdraw_fee;
@property (copy, nonatomic) NSString *frozen_money;

@property (copy, nonatomic) NSString *outer_mer_id;
@property (copy, nonatomic) NSString *outer_device_no;
@property (copy, nonatomic) NSString *terminal;
@property (copy, nonatomic) NSString *province;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *concat_name;
@property (copy, nonatomic) NSString *concat_phone;

@property (assign, nonatomic) NSInteger reach_status;
@property (copy, nonatomic) NSString *reach_date;
@property (copy, nonatomic) NSString *created_at;
@property (copy, nonatomic) NSString *updated_at;
@property (copy, nonatomic) NSString *other;
@property (copy, nonatomic) NSString *reach_status_str;
@property (strong, nonatomic) TypeModel *type;


@end

NS_ASSUME_NONNULL_END
