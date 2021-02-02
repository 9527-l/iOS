//
//  AppDelegate.m
//  中付掌柜
//
//  Created by Lee on 2020/11/12.
//

#import "AppDelegate.h"
#import "ZFTabBarViewController.h"
#import "ZFNavigationController.h"
#import "IQKeyboardManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    ZFTabBarViewController *vc = [[ZFTabBarViewController alloc] init];
    ZFNavigationController *rootVC = [[ZFNavigationController alloc] initWithRootViewControllerNoWrapping:vc];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    [[IQKeyboardManager sharedManager] setEnable:YES];
    
    id token = [ZFSaveValueTool getDefaults:auth_token];
    if ([NSObject isBlank:token]) {
        [ZFPresentLoginVcTool presentLoginVC:rootVC];
    }else{
        NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
        [parameters setValue:[ZFSaveValueTool getToken] forKey:@"auth_token"];
        [parameters setValue:[ZFSaveValueTool getAuthToken] forKey:@"refresh_token"];
        [[BasicNetWorking sharedSessionManager] GET:auth parameters:parameters success:^(id responseObject) {
                    
                
        } failure:^(NSError *error) {
                    
                
        }];
    }
    [self uploadFaileData];
    return YES;
}


-(void)applicationWillEnterForeground:(UIApplication *)application{
    
}

- (void)applicationWillResignActive:(UIApplication *)application{
    
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application{
    
}


- (void)applicationWillTerminate:(UIApplication *)application{
    
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return YES;
}

- (void)uploadFaileData{
//            取出之前上传失败的数据
    NSDictionary *dict = [ZFSaveValueTool getDefaults:uploadFaileBusinessInfos];
    NSMutableDictionary *saveDict = [NSMutableDictionary dictionaryWithCapacity:2];
    if (![NSObject isBlank:dict]) {
        [saveDict addEntriesFromDictionary:dict];
    }
    for (NSDictionary *tempDict in saveDict) {
        if ([NSObject isBlank:tempDict[@"merchantCode"]]) {
            [MBProgressHUD showToast:@"数据异常"];
            continue;
        }
        NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
        [parameters setValue:tempDict[@"merchantCode"] forKey:@"outer_mer_id"];
        [parameters setValue:tempDict[@"merchantName"] forKey:@"outer_mer_name"];
        NSString *merchantStepProgess = tempDict[@"merchantStepProgess"];
        if ([merchantStepProgess isEqual:@"0"] || [merchantStepProgess isEqual:@"2"]) {
            [parameters setValue:@"0" forKey:@"status"];
        }else if ([merchantStepProgess isEqual:@"1"] || [merchantStepProgess isEqual:@"3"]) {
            [parameters setValue:@"1" forKey:@"status"];
        }
        [[BasicNetWorking sharedSessionManager] POST:merchantSignin parameters:parameters success:^(id responseObject) {
            [saveDict removeObjectForKey:tempDict[@"merchantCode"]];
        } failure:^(NSError *error) {
            
        }];
    }
    
}
@end
