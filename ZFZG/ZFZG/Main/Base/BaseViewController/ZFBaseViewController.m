//
//  ZFBaseViewController.m
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import "ZFBaseViewController.h"

@interface ZFBaseViewController ()

@end

@implementation ZFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置导航栏通用样式
    [self setNavBarView];
//    设置tabBar隐藏顶部黑线
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        self.tabBarController.tabBar.subviews[0].subviews[1].hidden = YES;
    }
    
}
- (void)loadData{
    
}
- (void)setNavBarView{
    self.navigationController.navigationBar.barTintColor = MainColorBlue;
    UIImageView *lineView = [self findBottomLineInView:self.navigationController.navigationBar];
    if (lineView) {
        lineView.hidden = YES;
    }
}

- (UIImageView *)findBottomLineInView:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findBottomLineInView:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
@end
