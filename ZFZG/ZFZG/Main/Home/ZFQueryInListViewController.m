//
//  ZFQueryInListViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFQueryInListViewController.h"
#import "ZFBusinessInfoViewController.h"
#import "ZFQueryInViewCell.h"
@interface ZFQueryInListViewController ()

@end

@implementation ZFQueryInListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
-(void)setIndex:(NSInteger)index{
    _index = index;

    switch (index) {
        case 0:
            
            break;
        case 1:

            break;
        case 2:
            
            break;
        case 3:
            
            break;
        default:
            break;
    }
//    请求接口
}

- (void)pushToOtherVC:(Class)vcClass{
    
    if ([vcClass isEqual:[ZFBusinessInfoViewController class]]) {
        ZFBusinessInfoViewController *vc = [[ZFBusinessInfoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFQueryInViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ZFQueryInViewCell class]) forIndexPath:indexPath];
    cell.cellTag = self.index;
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




