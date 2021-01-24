//
//  ZFFeedBackViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFFeedBackViewController.h"

@interface ZFFeedBackViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *contentTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentCountLab;

@end

@implementation ZFFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"意见反馈";
}
@end
