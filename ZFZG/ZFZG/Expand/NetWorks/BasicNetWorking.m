//
//  BasicNetWorking.m
//  AFN二次封装
//
//  Created by 赵师顺 on 16/10/9.
//  Copyright © 2016年 赵师顺. All rights reserved.
//

#import "BasicNetWorking.h"
#import "MBProgressHUD+MJ.h"

@implementation BasicNetWorking

+ (instancetype)sharedSessionManager {
    static BasicNetWorking *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:kHOSTURL];
    });
    if (![NSObject isBlank:[ZFSaveValueTool getToken]]) {
        [manager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",[ZFSaveValueTool getToken]] forHTTPHeaderField:@"Authorization"];
    }
    return manager;
}
- (instancetype)initWithBaseURL:(NSString *)url {
    self = [super initWithBaseURL:[NSURL URLWithString:url]];
    if (self) {
        // 请求序列化
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 30;
        // 请求头设定
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [self.requestSerializer setValue:@"xmlhttprequest" forHTTPHeaderField:@"X-Requested-With"];
        [self.requestSerializer setValue:@"application/json,text/javascript" forHTTPHeaderField:@"accept"];

        // 响应序列化
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
        // 安全策略 - 无条件信任
        self.securityPolicy = [[AFSecurityPolicy alloc] init];
        [self.securityPolicy setAllowInvalidCertificates:YES];
        [self.securityPolicy setValidatesDomainName:NO];
    }
    return self;
}

- (void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^) (id responseObject))success failure:(void (^) (NSError *error))failure
{
    [self GET:urlString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^) (NSError *error))failure
{
    
    [self POST:urlString parameters:parameters headers:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            BOOL successValue = [responseObject[@"success"] boolValue];
            if (successValue) {
                if (success) {
                    success(responseObject);
                }
            }else{
                [MBProgressHUD showToast:responseObject[@"message"]];
                if (failure) {
                    NSString *domain = @"com.MyCompany.MyApplication.ErrorDomain";
                    NSString *desc = responseObject[@"message"];
                    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : desc };
                    NSError *error = [NSError errorWithDomain:domain code:-101 userInfo:userInfo];
                    failure(error);
                }
            }
        }
        

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (error.code == -1001) {
            [MBProgressHUD showToast:@"请求超时，请稍后重试！"];
        }else{
            [MBProgressHUD showToast:@"网络请求失败，请稍后重试！"];
        }
        
        if (failure) {
            failure(error);
        }
        
    }];
}
- (void)uploadMorePost:(NSString *)urlString parameters:(id)parameters UploadImage:(NSArray *)imageArray ImageKey:(NSArray *)imageKeys success:(void (^)(id responseObject))successs failure:(void (^)(NSError *error))failure
{
    if (imageKeys.count == 0) {
        [MBProgressHUD showError:[NSString stringWithFormat:@"%@为空",imageKeys]];
        return ;
    }
    if (imageArray.count == 0) {
        [MBProgressHUD showError:[NSString stringWithFormat:@"%@为空",imageArray]];
        return;
    }
    [self POST:urlString parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < imageArray.count; i++) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        UIImage *image = imageArray[i];
        NSData *data = UIImageJPEGRepresentation(image, 0.7);
        [formData appendPartWithFileData:data name:((imageKeys.count > 1) ? (imageKeys[i]) : (imageKeys.firstObject)) fileName:fileName mimeType:@"image/png"];
    }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successs) {
            successs(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

- (void)ReachabilityStatus:(void (^)(id string))netStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown:
                
                if (netStatus) {
                    netStatus(@"未知网络类型");
                }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                
                if (netStatus) {
                    netStatus(@"无可用网络");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                if (netStatus) {
                    netStatus(@"当前WIFE下");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                if (netStatus) {
                    netStatus(@"使用蜂窝流量");
                }
                break;
                
            default:
                
                break;
        }
    }];
    [manager startMonitoring];
}




@end
