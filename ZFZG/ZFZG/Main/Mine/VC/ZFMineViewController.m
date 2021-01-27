//
//  ZFMineViewController.m
//  ZFZG
//
//  Created by 李胜 on 2020/11/15.
//

#import "ZFMineViewController.h"
#import "ZFContactUsViewController.h"
#import "ZFChangePwdViewController.h"
#import "ZFFeedBackViewController.h"
#import "ZFLoginViewController.h"

#import "ZFMineListView.h"
#import "ZFMineHeaderView.h"


typedef enum : NSUInteger {
    HeaderClickEvent,
    ChangePwdClickEvent,
    ContactClickEvent,
    FeedbackClickEvent,
    ExitClickEvent,
} EventType;

@interface ZFMineViewController ()

@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) ZFMineHeaderView *headerView;

@end

@implementation ZFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginOut) name:@"ChangePwd" object:nil];
    [self loadData];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}
- (void)setNavBarView{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)setUpUI{
    
    [self.view addSubview:self.scrollerView];
    [self.scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-kTabBarHeight);
    }];
    
    
    [self.scrollerView addSubview:self.headerView];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollerView.mas_top);
        make.left.equalTo(self.scrollerView.mas_left);
        make.width.mas_equalTo(Screen_Width);
        make.height.mas_equalTo(kNavBarAndStatusBarHeight + 200);
    }];
    
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.scrollerView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(-130);
        make.left.equalTo(self.scrollerView.mas_left).offset(15);
        make.width.mas_offset(Screen_Width - 30);
        make.height.mas_equalTo(Screen_Height);
    }];
    bgView.layer.cornerRadius = 8;
    bgView.layer.masksToBounds = YES;
    
    ZFMineListView *list1 = [self createListViewWithImageName:@"pwd" title:@"修改密码" showArrow:YES event:ChangePwdClickEvent];
    [bgView addSubview:list1];
    [list1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_top).offset(30);
        make.left.equalTo(bgView.mas_left);
        make.width.mas_equalTo(bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list2 = [self createListViewWithImageName:@"msg" title:@"联系我们" showArrow:YES event:ContactClickEvent];
    [bgView addSubview:list2];
    [list2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list1.mas_bottom).offset(0);
        make.left.equalTo(bgView.mas_left);
        make.width.mas_equalTo(bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list3 = [self createListViewWithImageName:@"fankui" title:@"意见反馈" showArrow:YES event:FeedbackClickEvent];
    [bgView addSubview:list3];
    [list3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list2.mas_bottom).offset(0);
        make.left.equalTo(bgView.mas_left);
        make.width.mas_equalTo(bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list4 = [self createListViewWithImageName:@"exit" title:@"退出登录" showArrow:YES event:ExitClickEvent];
    [bgView addSubview:list4];
    [list4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list3.mas_bottom).offset(0);
        make.left.equalTo(bgView.mas_left);
        make.width.mas_equalTo(bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
}
- (void)viewDidClickWithEvent:(EventType)type{
    switch (type) {
        case HeaderClickEvent:
            
            break;
        case ChangePwdClickEvent:
        {
            ZFChangePwdViewController *vc = [[ZFChangePwdViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case ContactClickEvent:
        {
            ZFContactUsViewController *vc = [[ZFContactUsViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case FeedbackClickEvent:
        {
            ZFFeedBackViewController *vc = [[ZFFeedBackViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case ExitClickEvent:
        {
            [self userLoginOut];
        }
            break;
        default:
            break;
    }
}
- (void)userLoginOut{
    [[BasicNetWorking sharedSessionManager] POST:logout parameters:nil success:^(id responseObject) {
        [ZFPresentLoginVcTool presentLoginVC:self];
        [ZFSaveValueTool userLoginOut];
    } failure:^(NSError *error) {
            
    }];

}
- (ZFMineListView *)createListViewWithImageName:(NSString *)iconName title:(NSString *)title showArrow:(BOOL)showArrow event:(EventType)event{
    ZFMineListView *view = [[ZFMineListView alloc] init];
    WeakSelf(self);
    view.viewDidClickBlock = ^{
        [weakself viewDidClickWithEvent:event];
    };
    [view setUIWithImageName:iconName title:title showArrow:showArrow];
    return view;
}
- (void)loadData{
    [[BasicNetWorking sharedSessionManager] GET:me parameters:nil success:^(id responseObject) {
            
        } failure:^(NSError *error) {
            
        }];
}

- (UIScrollView *)scrollerView{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.backgroundColor = [UIColor cjColorAlphaWithHexString:@"f2f2f2"];
    }
    return _scrollerView;
}
- (ZFMineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[ZFMineHeaderView alloc] init];
        WeakSelf(self);
        _headerView.viewDidClickBlock = ^{
            [weakself viewDidClickWithEvent:HeaderClickEvent];
        };
    }
    return _headerView;
}
@end
