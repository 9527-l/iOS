//
//  ZFChangePwdViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFChangePwdViewController.h"

@interface ZFChangePwdViewController ()
@property (weak, nonatomic) IBOutlet UITextField *oldPwdField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *againPwdField;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;

@end

@implementation ZFChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.commitBtn.backgroundColor = MainColorBlue;
    self.commitBtn.layer.cornerRadius = 8;
    self.commitBtn.layer.masksToBounds = YES;
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"修改密码";
}

@end
