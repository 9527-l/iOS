//
//  AppDelegate.m
//  中付掌柜
//
//  Created by Lee on 2020/11/12.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UIViewController * vc = [[UIViewController alloc] init];
    
    UINavigationController * navi = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
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


@end
