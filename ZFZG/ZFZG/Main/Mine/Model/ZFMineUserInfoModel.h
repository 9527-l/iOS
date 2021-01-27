//
//  ZFMineUserInfoModel.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMineUserInfoModel : NSObject

//        "id": 1,
//        "username": "admin",
//        "mobile": "18565662116",
//        "email": "",
//        "nickname": "",
//        "reg_ip": 0,
//        "last_login_time": "2021-01-27 17:14:01",
//        "last_login_ip": 2006178346,
//        "source_id": 0,
//        "status": 1,
//        "created_at": null,
//        "updated_at": "2021-01-27 17:14:01",
//        "status_str": "\u542f\u7528",
//        "agent": {
//            "uid": 1,
//            "name": "\u4e2d\u4ed8\u8054\u76df",
//            "nickname": "\u4e2d\u4ed8\u8054\u76df",
//            "pid": 0,
//            "status": 1,
//            "withdraw_status": 1,
//            "account_status": 1,
//            "invite_uid": 0,
//            "rise_level_id": 63,
//            "created_at": "2019-01-03 15:53:56",
//            "updated_at": "2020-08-14 12:28:35",
//            "deleted_at": null,
//            "give_count": "2",
//            "uuid": "18565662116",
//            "user_nick_name": "\u4e2d\u4ed8\u8054\u76df",
//            "user": {
//                "id": 1,
//                "username": "admin",
//                "mobile": "18565662116",
//                "email": "",
//                "nickname": "",
//                "reg_ip": 0,
//                "last_login_time": "2021-01-27 17:14:01",
//                "last_login_ip": 2006178346,
//                "source_id": 0,
//                "status": 1,
//                "created_at": null,
//                "updated_at": "2021-01-27 17:14:01",
//                "status_str": "\u542f\u7528"
//            }
//        }
//    }

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) BOOL isShowArrow;
@end

NS_ASSUME_NONNULL_END
