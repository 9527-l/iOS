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

@end

@implementation ZFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (void)createData{
    
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
        cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFHomeOneViewCell class]) forIndexPath:indexPath];
    }else if (indexPath.row <= 4){
        ZFHomeTwoViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFHomeTwoViewCell class]) forIndexPath:indexPath];
        cell1.indexPath = indexPath;
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
    NSLog(@"1111111111");
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
