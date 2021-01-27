//
//  ZFConst.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#ifndef ZFConst_h
#define ZFConst_h

#pragma mark -- 本地存储的Key
static NSString *auth_token = @"auth_token";
static NSString *refresh_token = @"refresh_token";



#pragma mark -- 接口地址
/// 登录
static NSString *loginUrl = @"login";
/// 刷新token
static NSString *auth = @"auth";
/// 获取首页统计数量
static NSString *merchantNum = @"merchant/signin-sum";
/// 忘记密码-获取验证码
static NSString *smscode = @"smscode";
/// 忘记密码-获取重置密码的请求地址
static NSString *passwordMobile = @"password/mobile";
/// 用户修改密码
static NSString *userChangePwd = @"user/change-pwd";
/// 用户退出登录
static NSString *logout = @"logout";
#endif /* ZFConst_h */





