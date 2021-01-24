//
//  ZFQueryInListViewController.h
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBaseTableViewController.h"
#import "JXCategoryListContainerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZFQueryInListViewController : ZFBaseTableViewController<JXCategoryListContentViewDelegate>
@property (nonatomic, assign) NSInteger index;
@end

NS_ASSUME_NONNULL_END
