//
//  ZFMineViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFMineViewController.h"
#import "ZFMineListViewCell.h"
#import "ZFMineHeaderViewCell.h"


@interface ZFMineViewController ()

@end

@implementation ZFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpTableView];
//    []
}


- (void)setUpTableView{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
