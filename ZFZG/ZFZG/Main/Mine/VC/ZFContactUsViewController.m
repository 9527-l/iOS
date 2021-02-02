//
//  ZFContactUsViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/23.
//

#import "ZFContactUsViewController.h"
#import "ZFContactUsViewCell.h"
@interface ZFContactUsViewController ()
@property (strong, nonatomic) UILabel *nameLab;
@property (strong, nonatomic) UILabel *phoneLab;
@end

@implementation ZFContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"联系我们";
}


- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(kNavBarAndStatusBarHeight);
        make.bottom.equalTo(self.view).offset(0);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFContactUsViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFContactUsViewCell class])];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
}
- (void)loadData{
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] GET:manageContacte parameters:nil success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            weakself.phoneLab.text = data[@"phone"];
            weakself.nameLab.text = data[@"name"];
        }
    } failure:^(NSError *error) {
            
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFContactUsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFContactUsViewCell class]) forIndexPath:indexPath];
    cell.indexPath = indexPath;
    if (indexPath.section == 0) {
        self.nameLab = cell.rightLab;
    }else{
        self.phoneLab = cell.rightLab;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    return  view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
