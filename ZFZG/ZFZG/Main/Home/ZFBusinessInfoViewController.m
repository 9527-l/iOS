//
//  ZFBusinessInfoViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBusinessInfoViewController.h"
#import "ZFBusinessInfoViewCell.h"
#import "ZFBusinessInfoModel.h"
#import "ZFBusinessListModel.h"
@interface ZFBusinessInfoViewController ()

@end

@implementation ZFBusinessInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"商户信息";
}


- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kNavBarAndStatusBarHeight);
        make.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFBusinessInfoViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFBusinessInfoViewCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
}
- (void)loadData{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    if (![NSObject isBlank:self.outer_device_no]) {
        [parameters setValue:self.outer_device_no forKey:@"outer_device_no"];
    }
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] GET:agentMerchant parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            ZFBusinessInfoModel *model = [ZFBusinessInfoModel yy_modelWithDictionary:data];
            [weakself dealDataWithModel:model];
        }
    } failure:^(NSError *error) {
            
    }];
}
- (void)dealDataWithModel:(ZFBusinessInfoModel *)model{
    NSMutableArray *arr1 = [NSMutableArray arrayWithCapacity:2];
    ZFBusinessListModel *model1 = [ZFBusinessListModel businessListModelWithIconImageName:@"001" leftStr:@"机器编号" rightStr:model.outer_device_no];
    ZFBusinessListModel *model2 = [ZFBusinessListModel businessListModelWithIconImageName:@"002" leftStr:@"终端编号" rightStr:model.terminal];
    ZFBusinessListModel *model3 = [ZFBusinessListModel businessListModelWithIconImageName:@"003" leftStr:@"商户编号" rightStr:model.outer_mer_id];
    ZFBusinessListModel *model4 = [ZFBusinessListModel businessListModelWithIconImageName:@"004" leftStr:@"商户名称" rightStr:model.outer_mer_name];
    ZFBusinessListModel *model5 = [ZFBusinessListModel businessListModelWithIconImageName:@"005" leftStr:@"联系人" rightStr:model.concat_name];
    ZFBusinessListModel *model6 = [ZFBusinessListModel businessListModelWithIconImageName:@"006" leftStr:@"联系电话" rightStr:model.concat_phone];
    ZFBusinessListModel *model7 = [ZFBusinessListModel businessListModelWithIconImageName:@"007" leftStr:@"所属区域" rightStr:model.city];
    [arr1 addObject:model1];
    [arr1 addObject:model2];
    [arr1 addObject:model3];
    [arr1 addObject:model4];
    [arr1 addObject:model5];
    [arr1 addObject:model6];
    [arr1 addObject:model7];
    
    NSMutableArray *arr2 = [NSMutableArray arrayWithCapacity:2];
    ZFBusinessListModel *model8 = [ZFBusinessListModel businessListModelWithIconImageName:@"008" leftStr:@"刷卡费率" rightStr:[NSString stringWithFormat:@"%.2f%%", [model.sign_fee floatValue] * 100]];
    ZFBusinessListModel *model9 = [ZFBusinessListModel businessListModelWithIconImageName:@"009" leftStr:@"提现费" rightStr:model.withdraw_fee];
    [arr2 addObject:model8];
    [arr2 addObject:model9];
    
    [self.dataSourceArr addObject:arr1];
    [self.dataSourceArr addObject:arr2];
    [self.tableView reloadData];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSourceArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = self.dataSourceArr[section];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = self.dataSourceArr[indexPath.section];
    ZFBusinessListModel *model = [arr objectAtIndex:indexPath.row];
    ZFBusinessInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFBusinessInfoViewCell class]) forIndexPath:indexPath];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bgView = [[UIView alloc] init];
    UILabel *lab = [[UILabel alloc] init];
    lab.font = [UIFont boldSystemFontOfSize:24];
    if (section == 0) {
        lab.text = @"商户基本信息";
    }else{
        lab.text = @"费率信息";
    }
    lab.frame = CGRectMake(20, 0, Screen_Width - 40, 50);
    [bgView addSubview:lab];
    return bgView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
@end
