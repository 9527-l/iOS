//
//  ZFBaseTableViewController.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import "ZFBaseAppViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZFBaseTableViewController : ZFBaseAppViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;

- (void)addRefreshHeaderView;
- (void)addRefreshfooterView;
- (void)endRefresh;

/// 增加页码，调用loadData,一般不需要子类重写，如果有特殊要求可以重写这个方法
- (void)loadMoreData;
- (void)setUpTableView;

@end

NS_ASSUME_NONNULL_END
