//
//  ZFQueryInViewController.h
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBaseViewController.h"
#import "JXCategoryView.h"
#import "JXCategoryListContainerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFQueryInViewController : ZFBaseViewController<JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
- (void)setSelectedIndex:(NSInteger) selectedIndex;
@end

NS_ASSUME_NONNULL_END
