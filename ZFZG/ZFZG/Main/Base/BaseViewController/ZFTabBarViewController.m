//
//  ZFTabBarViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFTabBarViewController.h"
#import "ZFHomeViewController.h"
#import "ZFMineViewController.h"
#import "ZFNavigationController.h"
#import <RTRootNavigationController.h>

@interface ZFTabBarViewController ()

@end

@implementation ZFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}
- (void)setupUI{
    [self addChildViewController:[[ZFHomeViewController alloc] init]  imageNamed:@"home" title:@"首页"];
    [self addChildViewController:[[ZFMineViewController alloc] init] imageNamed:@"management" title:@"我的"];
    self.tabBar.barTintColor = [UIColor whiteColor];
}
- (void)addChildViewController:(UIViewController *)childController imageNamed:(NSString *)imageName title:(NSString *)title{
    //包裹一个自定义的导航
    RTContainerNavigationController * nav = [[RTContainerNavigationController alloc] initWithRootViewController:childController];
    //设置tabBarItem的title
    childController.title = title;
    //设置文字样式
    NSMutableDictionary *textAtts = [NSMutableDictionary dictionary];
    textAtts[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAtts[NSFontAttributeName] = [UIFont systemFontOfSize:14];
    
    NSMutableDictionary *selectTextAtts = [NSMutableDictionary dictionary];
    selectTextAtts[NSForegroundColorAttributeName] = MainColorBlue;
    selectTextAtts[NSFontAttributeName] = [UIFont systemFontOfSize:14];

    [childController.tabBarItem setTitleTextAttributes:textAtts forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectTextAtts forState:UIControlStateSelected];
    
    //设置tabBarItem的图标
    //声明：这张图片按照原来的样子显示出来，不要自动渲染成其他颜色（默认蓝色）
    UIImage *normalImage = [UIImage createNewImage:[UIImage imageNamed:imageName] multiple:0.25];
    childController.tabBarItem.image = normalImage;
    childController.tabBarItem.selectedImage = [UIImage createNewImage:[[UIImage imageNamed:[NSString stringWithFormat:@"%@_select", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] multiple:0.25];
    
    [self addChildViewController:nav];
    
}

@end
