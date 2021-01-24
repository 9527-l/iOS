//
//  ZFBaseTableViewController.m
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import "ZFBaseTableViewController.h"
#import "ZFNavgationBarView.h"
@interface ZFBaseTableViewController ()

@end

@implementation ZFBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    self.pageNo = 0;
    self.pageSize = 20;
    
}
- (void)setUpTableView{
    
}
- (void)addRefreshHeaderView{
    WeakSelf(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakself.pageNo = 0;
        [weakself.dataSourceArr removeAllObjects];
        [weakself loadData];
    }];
}
- (void)addRefreshfooterView{
    WeakSelf(self)
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakself loadMoreData];
    }];
}
- (void)loadMoreData{
    self.pageNo ++;
    [self loadData];
}



- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSMutableArray *)dataSourceArr{
    if (!_dataSourceArr) {
        _dataSourceArr = [NSMutableArray arrayWithCapacity:2];
    }
    return _dataSourceArr;
}
@end
