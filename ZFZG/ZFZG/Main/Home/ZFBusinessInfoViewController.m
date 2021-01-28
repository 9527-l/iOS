//
//  ZFBusinessInfoViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBusinessInfoViewController.h"
#import "ZFBusinessInfoViewCell.h"
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
    [[BasicNetWorking sharedSessionManager] GET:agentMerchant parameters:parameters success:^(id responseObject) {
            
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
    
    ZFBusinessInfoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFBusinessInfoViewCell class]) forIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"1111111111");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40;
}

@end
