//
//  ZFHomeViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFHomeViewController.h"
#import "ZFMineListViewCell.h"
#import "ZFMineHeaderViewCell.h"
@interface ZFHomeViewController ()

@end

@implementation ZFHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableView];
    
}

- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(44);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFMineListViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFMineListViewCell class])];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ZFMineHeaderViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ZFMineHeaderViewCell class])];
}
- (void)createData{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc] init];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
