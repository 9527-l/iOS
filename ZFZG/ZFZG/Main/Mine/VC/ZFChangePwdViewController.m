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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    
}

- (IBAction)sureBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.oldPwdField.text] || [NSObject isBlank:self.pwdField.text] || [NSObject isBlank:self.againPwdField.text]) {
        [MBProgressHUD showToast:@"请输入密码"];
        return;
    }
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:self.oldPwdField.text forKey:@"old_password"];
    [parameters setValue:self.pwdField.text forKey:@"password"];
    [parameters setValue:self.againPwdField.text forKey:@"password_confirmation"];
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] POST:userChangePwd parameters:parameters success:^(id responseObject) {
        [MBProgressHUD showToast:@"密码修改成功，请重新登录"];
        [weakself.navigationController popViewControllerAnimated:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangePwd" object:nil];
    } failure:^(NSError *error) {
        
    }];
}

@end
