//
//  ZFBaseViewController.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import <UIKit/UIKit.h>
#import <UIViewController+RTRootNavigationController.h>
#import <RTRootNavigationController.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFBaseViewController : UIViewController

- (void)loadData;

/// 基类里设置导航栏字体颜色，隐藏底部黑线，设置导航栏背景色
- (void)setNavBarView;

/// 查找指定view中的高度为1的分割线（主要是导航栏）
/// @param view 需要查找的view
- (UIImageView *)findBottomLineInView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
