//
//  ZFPresentLoginVcTool.m
//  ZFZG
//
//  Created by Lee on 2021/1/26.
//

#import "ZFPresentLoginVcTool.h"
#import "ZFLoginViewController.h"
#import <RTRootNavigationController.h>
@implementation ZFPresentLoginVcTool
+ (void)presentLoginVC:(UIViewController *)vc{
    AppDelegate *myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if (!myDelegate.isShowLoginVC) {
        ZFLoginViewController *loginVc = [[ZFLoginViewController alloc] init];
        RTContainerNavigationController *navVC = [[RTContainerNavigationController alloc] initWithRootViewController:loginVc];
        RTRootNavigationController *rootVC = [[RTRootNavigationController alloc] initWithRootViewControllerNoWrapping:navVC];
        rootVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [vc presentViewController:rootVC animated:YES completion:^{
                        
        }];
        [ZFSaveValueTool userLoginOut];
        myDelegate.isShowLoginVC = YES;
    }
    
}
@end
