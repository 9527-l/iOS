//
//  ZFHomeViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFHomeViewController.h"
#import "ZFQueryInViewController.h"
#import "ZFBusinessRegistrationViewController.h"

#import "ZFHomeOneViewCell.h"
#import "ZFHomeTwoViewCell.h"
#import "ZFHomeThreeViewCell.h"
@interface ZFHomeViewController ()

@property (strong, nonatomic) UILabel *mGrowthLab;
@property (strong, nonatomic) UILabel *nGrowthLab;
@property (strong, nonatomic) UILabel *yGrowthLab;

@property (strong, nonatomic) UILabel *lab1;
@property (strong, nonatomic) UILabel *lab2;
@property (strong, nonatomic) UILabel *lab3;
@property (strong, nonatomic) UILabel *lab4;

@end

@implementation ZFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"进件" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:32];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}


- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kNavBarAndStatusBarHeight);
        make.bottom.equalTo(self.view).offset(-kTabBarHeight);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFHomeOneViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFHomeOneViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFHomeTwoViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFHomeTwoViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFHomeThreeViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFHomeThreeViewCell class])];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
}
- (void)loadData{
    WeakSelf(self)
//    status:签约状态 0=待提交 1=成功 2=失败 3=待审核
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:@"0" forKey:@"status"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.lab4.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
    
    [parameters setValue:@"1" forKey:@"status"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.lab1.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
    
    [parameters setValue:@"2" forKey:@"status"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.lab3.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
    
    [parameters setValue:@"3" forKey:@"status"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.lab2.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
    
    [parameters setValue:@"1" forKey:@"status"];
    
//    今天
    [parameters setValue:[[NSDate date] formatYMDWithSeparate:@"-"] forKey:@"start_date"];
    [parameters setValue:[[NSDate date] formatYMDWithSeparate:@"-"] forKey:@"end_date"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.nGrowthLab.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
//    昨天
    [parameters setValue:[[NSDate dateYesterday] formatYMDWithSeparate:@"-"] forKey:@"start_date"];
    [parameters setValue:[[NSDate dateYesterday] formatYMDWithSeparate:@"-"] forKey:@"end_date"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.yGrowthLab.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];
//    本月
    NSString *endData = [[NSDate date] formatYMDWithSeparate:@"-"];
    NSString *startDate = [NSString stringWithFormat:@"%lu-%02lu-01", [NSDate date].year, [NSDate date].month];
    [parameters setValue:startDate forKey:@"start_date"];
    [parameters setValue:endData forKey:@"end_date"];
    [[BasicNetWorking sharedSessionManager] GET:merchantNum parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.mGrowthLab.text = data[@"count"] ? [NSString stringWithFormat:@"%@",  data[@"count"]] : @"0";
        }
    } failure:^(NSError *error) {
        
    }];



}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.row == 0) {
        ZFHomeOneViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFHomeOneViewCell class]) forIndexPath:indexPath];
        self.mGrowthLab = cell1.mCountLab;
        self.nGrowthLab = cell1.nCountLab;
        self.yGrowthLab = cell1.yCountLab;
        cell = cell1;
    }else if (indexPath.row <= 4){
        ZFHomeTwoViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFHomeTwoViewCell class]) forIndexPath:indexPath];
        cell1.indexPath = indexPath;
        switch (indexPath.row) {
            case 1:
                self.lab1 = cell1.countLab;
                break;
            case 2:
                self.lab2 = cell1.countLab;
                break;
            case 3:
                self.lab3 = cell1.countLab;
                break;
            case 4:
                self.lab4 = cell1.countLab;
                break;
            default:
                break;
        }
        cell = cell1;
    }else{
        ZFHomeThreeViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFHomeThreeViewCell class]) forIndexPath:indexPath];
//        cell1.btnDidClickBlock = ^{
//            
//        };
        cell = cell1;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row >=1 && indexPath.row <= 4) {
        ZFQueryInViewController *vc = [[ZFQueryInViewController alloc] init];
        [vc setSelectedIndex:indexPath.row - 1];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.row == 5){
        ZFBusinessRegistrationViewController *vc = [[ZFBusinessRegistrationViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0.0001;
    if (indexPath.row == 0) {
        height = 200;
    }else if (indexPath.row <= 4){
        height = 70;
    }else{
        height = 60;
    }
    return height;
}
@end
