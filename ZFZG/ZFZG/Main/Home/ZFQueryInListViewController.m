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
#import "ZFMerchantManager.h"
@interface ZFQueryInListViewController ()<ZFMerchantManagerDelegate>

@end

@implementation ZFQueryInListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addRefreshHeaderView];
    [self addRefreshfooterView];
    [ZFMerchantManager shareManager].delegate = self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFQueryInViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFQueryInViewCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
}
- (void)loadData{
//    status:签约状态 0=待提交 1=成功 2=失败 3=待审核
    NSString *status = 0;
    switch (self.index) {
        case 0:
            status = @"0";
            break;
        case 1:
            status = @"3";
            break;
        case 2:
            status = @"1";
            break;
        case 3:
            status = @"2";
            break;
        default:
            break;
    }

    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:status forKey:@"status"];
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
- (void)pushToOtherVCWithModel:(ZFQueryInListModel *)model tag:(NSInteger)tag{
    
    if (tag == 2) {
        ZFBusinessInfoViewController *vc = [[ZFBusinessInfoViewController alloc] init];
        vc.outer_device_no = model.outer_device_no;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (tag == 0){
//        待提交
        [self commitInfoWithOuterMerId:model.outer_mer_id];
    }else if (tag == 3){
//        失败
        [self commitInfoWithOuterMerId:model.outer_mer_id];
    }
}
- (void)commitInfoWithOuterMerId:(NSString *)outer_mer_id{
    [[BasicNetWorking sharedSessionManager] GET:me parameters:nil success:^(id responseObject) {
    NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            NSString *uid = data[@"agent"][@"uid"];
            [[ZFMerchantManager shareManager] changeInfoWithAccount:@"xieguangsheng" merchantCode:outer_mer_id viewController:self other:[NSString stringWithFormat:@"%@", uid]];
        }
    } failure:^(NSError *error) {
        
    }];

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
    cell.bottomBtnDidClickBlock = ^(ZFQueryInListModel * _Nonnull model, NSInteger cellTag) {
        [weakself pushToOtherVCWithModel:model tag:cellTag];
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"1111111111");
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 60;
//}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return  [[UIView alloc] init];
}

- (UIView *)listView {
    return self.view;
}

- (void)merchantManagerReturnSuccess:(NSDictionary *)merchantInfo other:(NSString *)other{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:merchantInfo[@"merchantCode"] forKey:@"outer_mer_id"];
    [parameters setValue:merchantInfo[@"merchantName"] forKey:@"outer_mer_name"];
    NSString *merchantStepProgess = merchantInfo[@"merchantStepProgess"];
    if ([merchantStepProgess isEqual:@"0"] || [merchantStepProgess isEqual:@"2"]) {
        [parameters setValue:@"0" forKey:@"status"];
    }else if ([merchantStepProgess isEqual:@"1"] || [merchantStepProgess isEqual:@"3"]) {
        [parameters setValue:@"1" forKey:@"status"];
    }
    
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] POST:merchantSignin parameters:parameters success:^(id responseObject) {
        [weakself dismissViewControllerAnimated:YES completion:nil];
//        界面数据刷新
//        [weakself loadData];
        } failure:^(NSError *error) {
//            保存数据，再次打开app时上传
        }];
}
- (void)merchantManagerReturnError:(NSString *)msg{
    [MBProgressHUD showToast:msg];
//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end




