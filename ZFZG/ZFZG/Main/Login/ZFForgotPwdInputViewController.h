//
//  ZFForgotPwdInputViewController.h
//  ZFZG
//
//  Created by Lee on 2021/1/25.
//

#import "ZFBaseAppViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFForgotPwdInputViewController : ZFBaseAppViewController
@property (copy, nonatomic) NSString *phoneNum;
@property (copy, nonatomic) NSString *resetUrl;
@end

NS_ASSUME_NONNULL_END
