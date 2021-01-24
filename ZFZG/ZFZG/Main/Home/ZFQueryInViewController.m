//
//  ZFQueryInViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFQueryInViewController.h"
#import "ZFQueryInListViewController.h"
@interface ZFQueryInViewController ()<JXCategoryViewDelegate>

@end

@implementation ZFQueryInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.categoryView.frame = CGRectMake(0, kNavBarAndStatusBarHeight, self.view.bounds.size.width, 60);
    self.listContainerView.frame = CGRectMake(0, kNavBarAndStatusBarHeight + 60, self.view.bounds.size.width, self.view.bounds.size.height - 60 - kNavBarAndStatusBarHeight);
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"进件查询";
}
/**
 重载数据源：
 */
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
//    self.listContainerView.initListPercent = 0.5;
    [self.view addSubview:self.listContainerView];

    self.titles = @[@"待提交",@"待审核",@"通过",@"失败"];
    
    self.categoryView = [[JXCategoryTitleView alloc] init];
    //优化关联listContainer，以后后续比如defaultSelectedIndex等属性，才能同步给listContainer
    
    self.categoryView.listContainer = self.listContainerView;
    self.categoryView.delegate = self;
    self.categoryView.titles = self.titles;
    self.categoryView.defaultSelectedIndex = selectedIndex;
    self.categoryView.titleColor = [UIColor blackColor];
    self.categoryView.titleSelectedColor = [UIColor blackColor];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = MainColorBlue;
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.categoryView.indicators = @[lineView];
    
    [self.view addSubview:self.categoryView];
}

#pragma mark - JXCategoryListContainerViewDelegate

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    ZFQueryInListViewController *listVC = [[ZFQueryInListViewController alloc] init];
    listVC.index = index;
    return listVC;
}

#pragma mark - JXCategoryViewDelegate

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

@end
