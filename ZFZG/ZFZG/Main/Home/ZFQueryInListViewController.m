//
//  ZFQueryInListViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFQueryInListViewController.h"
#import "ZFBusinessInfoViewController.h"
#import "ZFQueryInViewCell.h"
#import "ZFQueryInListModel.h"
@interface ZFQueryInListViewController ()

@end

@implementation ZFQueryInListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self addRefreshHeaderView];
    [self addRefreshfooterView];
}
- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFQueryInViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFQueryInViewCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
}
- (void)loadData{
//    status:签约状态 0=待提交 1=成功 2=失败 3=待审核
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:[NSString stringWithFormat:@"%zd", self.index] forKey:@"status"];
    [parameters setValue:[NSString stringWithFormat:@"%zd", self.pageNo] forKey:@"page"];
    [parameters setValue:[NSString stringWithFormat:@"%zd", self.pageSize] forKey:@"limit"];
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] GET:merchantSigninList parameters:parameters success:^(id responseObject) {
        [weakself endRefresh];
        NSArray *arr = [ZFGetDataFromResponseTool getDataArr:responseObject];
        if (weakself.pageNo == 0) {
            [weakself.dataSourceArr removeAllObjects];
        }
        if (arr.count < weakself.pageSize) {
            [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
        }
        if (arr.count > 0) {
            [weakself.dataSourceArr addObjectsFromArray:[NSArray yy_modelArrayWithClass:[ZFQueryInListModel class] json:arr]];
        }
        [weakself.tableView reloadData];
    } failure:^(NSError *error) {
        [weakself endRefresh];
    }];
}
- (void)pushToOtherVC:(Class)vcClass{
    
    if ([vcClass isEqual:[ZFBusinessInfoViewController class]]) {
        ZFBusinessInfoViewController *vc = [[ZFBusinessInfoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFQueryInViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFQueryInViewCell class]) forIndexPath:indexPath];

    cell.cellTag = self.index;
    cell.model = [self.dataSourceArr objectAtIndex:indexPath.section];
    WeakSelf(self);
    cell.topBtnDidClickBlock = ^{
        
    };
    cell.bottomBtnDidClickBlock = ^{
        [weakself pushToOtherVC:[ZFBusinessInfoViewController class]];
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"1111111111");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

- (UIView *)listView {
    return self.view;
}
@end




