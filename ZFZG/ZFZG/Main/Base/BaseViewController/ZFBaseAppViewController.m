//
//  ZFBaseAppViewController.m
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import "ZFBaseAppViewController.h"

@interface ZFBaseAppViewController ()

@end

@implementation ZFBaseAppViewController

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
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19], NSForegroundColorAttributeName:[UIColor whiteColor]}];
    UIImageView *lineView = [self findBottomLineInView:self.navigationController.navigationBar];
    if (lineView) {
        lineView.hidden = YES;
    }
}

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"navi_black_back"] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(-10, 0, 40, 40);
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
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
