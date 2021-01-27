//
//  ZFForgotPwdInputViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/25.
//

#import "ZFForgotPwdInputViewController.h"

@interface ZFForgotPwdInputViewController ()
@property (weak, nonatomic) IBOutlet UITextField *pwd1;
@property (weak, nonatomic) IBOutlet UITextField *pwd2;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumLab;

@end

@implementation ZFForgotPwdInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sureBtn.layer.cornerRadius = 8;
    self.sureBtn.layer.masksToBounds = YES;
    self.phoneNumLab.text = [NSString stringWithFormat:@"您的账号：%@", self.phoneNum];
}
-(void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"忘记密码";
}
- (IBAction)sureBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.pwd1.text] || [NSObject isBlank:self.pwd2.text]) {
        [MBProgressHUD showToast:@"请输入密码"];
        return;
    }
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:self.pwd1.text forKey:@"password"];
    [parameters setValue:self.pwd2.text forKey:@"password_confirmation"];
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] POST:self.resetUrl parameters:parameters success:^(id responseObject) {
        [weakself.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        
    }];
}

@end
