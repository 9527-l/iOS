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
@property (nonatomic, strong) UIView *bgView;
@end

@implementation ZFMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpUI];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginOut) name:@"ChangePwd" object:nil];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setColorWithView:self.scrollerView size:CGSizeMake(Screen_Width, Screen_Height - kNavBarAndStatusBarAndTabBarHeight)];
    
    [self setColorWithView:self.bgView size:CGSizeMake(Screen_Width - 60, Screen_Height - kNavBarAndStatusBarAndTabBarHeight)];
}
- (void)setNavBarView{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)setColorWithView:(UIView *)view size:(CGSize)size{
    UIColor *colorOne = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    UIColor *colorTwo = [UIColor cjColorWithHexString:@"f7f7f7" alpha:0.8];
    
    NSArray *colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)colorTwo.CGColor, nil];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    //设置开始和结束位置(通过开始和结束位置来控制渐变的方向)
    
    gradient.startPoint = CGPointMake(0, 0.3);
    
    gradient.endPoint = CGPointMake(0, 0.8);
    
    gradient.colors = colors;
    
    gradient.frame = CGRectMake(0, 0, size.width, size.height);
    
    [view.layer insertSublayer:gradient atIndex:0];
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
//        make.height.mas_equalTo(Screen_Height - kNavBarAndStatusBarAndTabBarHeight);
    }];

    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.scrollerView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_bottom).offset(-100);
        make.left.equalTo(self.scrollerView.mas_left).offset(30);
        make.width.mas_offset(Screen_Width - 60);
        make.height.mas_equalTo(Screen_Height);
    }];
    self.bgView.layer.cornerRadius = 12;
    self.bgView.layer.masksToBounds = YES;
    
    ZFMineListView *list1 = [self createListViewWithImageName:@"pwd" title:@"修改密码" showArrow:YES event:ChangePwdClickEvent];
    [self.bgView addSubview:list1];
    [list1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_top).offset(30);
        make.left.equalTo(self.bgView.mas_left);
        make.width.mas_equalTo(self.bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list2 = [self createListViewWithImageName:@"msg" title:@"联系我们" showArrow:YES event:ContactClickEvent];
    [self.bgView addSubview:list2];
    [list2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list1.mas_bottom).offset(0);
        make.left.equalTo(self.bgView.mas_left);
        make.width.mas_equalTo(self.bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list3 = [self createListViewWithImageName:@"fankui" title:@"意见反馈" showArrow:YES event:FeedbackClickEvent];
    [self.bgView addSubview:list3];
    [list3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list2.mas_bottom).offset(0);
        make.left.equalTo(self.bgView.mas_left);
        make.width.mas_equalTo(self.bgView.mas_width);
        make.height.mas_equalTo(80);
    }];
    ZFMineListView *list4 = [self createListViewWithImageName:@"exit" title:@"退出登录" showArrow:YES event:ExitClickEvent];
    list4.sepLineView.hidden = YES;
    [self.bgView addSubview:list4];
    [list4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(list3.mas_bottom).offset(0);
        make.left.equalTo(self.bgView.mas_left);
        make.width.mas_equalTo(self.bgView.mas_width);
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
    WeakSelf(self)
    [[BasicNetWorking sharedSessionManager] GET:me parameters:nil success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        if (data.count) {
            NSString *userName = data[@"agent"][@"user_nick_name"];
            weakself.headerView.nameLab.text = userName;
        }
        } failure:^(NSError *error) {
            
        }];
}

- (UIScrollView *)scrollerView{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.backgroundColor = [UIColor cjColorWithHexString:@"f7f7f7" alpha:0.8];
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
