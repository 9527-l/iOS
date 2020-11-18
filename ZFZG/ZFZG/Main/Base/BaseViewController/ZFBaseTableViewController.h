//
//  ZFBaseTableViewController.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import "ZFBaseViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZFBaseTableViewController : ZFBaseViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;

- (void)addRefreshHeaderView;
- (void)addRefreshfooterView;

- (void)loadMoreData;

@end

NS_ASSUME_NONNULL_END
