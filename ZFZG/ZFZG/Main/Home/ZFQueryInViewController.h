//
//  ZFQueryInViewController.h
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBaseAppViewController.h"
#import "JXCategoryView.h"
#import "JXCategoryListContainerView.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFQueryInViewController : ZFBaseAppViewController<JXCategoryListContainerViewDelegate>
@property (nonatomic, strong) JXCategoryTitleView *categoryView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSArray <NSString *> *titles;
- (void)setSelectedIndex:(NSInteger) selectedIndex;
@end

NS_ASSUME_NONNULL_END
