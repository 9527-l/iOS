//
//  ZFMineViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFMineViewController.h"
#import "ZFMineListView.h"
#import "ZFMineHeaderView.h"


@interface ZFMineViewController ()

@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) ZFMineHeaderView *headerView;

@end

@implementation ZFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
}
- (void)setNavBarView{
    self.navigationController.navigationBar.hidden = YES;
    
}

- (ZFMineListView *)createListViewWithImageName:(NSString *)iconName title:(NSString *)title showArrow:(BOOL)showArrow{
    ZFMineListView *view = [[ZFMineListView alloc] init];
    return view;
}

- (UIScrollView *)scrollerView{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] init];
    }
    return _scrollerView;
}
- (ZFMineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[ZFMineHeaderView alloc] init];
    }
    return _headerView;
}
@end
