//
//  ZFBaseViewController.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFBaseViewController : UIViewController

- (void)loadData;
- (void)setNavBarView;

/// 查找指定view中的高度为1的分割线（主要是导航栏）
/// @param view 需要查找的view
- (UIImageView *)findBottomLineInView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
