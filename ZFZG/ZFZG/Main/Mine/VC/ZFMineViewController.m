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
    
}
- (void)setNavBarView{
    self.navigationController.navigationBar.hidden = YES;
    
}


- (UIScrollView *)scrollerView{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] init];
    }
    return _scrollerView;
}

@end
