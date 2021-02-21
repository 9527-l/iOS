//
//  ZFLoginViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFLoginViewController.h"
#import "ZFForgotPwdGetCodeViewController.h"

@interface ZFLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPwdBtn;
@property (strong, nonatomic) UIImageView *secureTextImageView;
@end

@implementation ZFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFieldLeftView:self.phoneNumField leftImageName:@"012"];
    [self setFieldRightView:self.phoneNumField rightImageName:@"010" btnTag:0];
    [self setFieldLeftView:self.pwdField leftImageName:@"011"];
    [self setFieldRightView:self.pwdField rightImageName:@"013" btnTag:1];
    
    self.loginBtn.layer.cornerRadius = 8;
    self.loginBtn.layer.masksToBounds = YES;
    

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"登录";
}
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.userInteractionEnabled = NO;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
- (void)setFieldLeftView:(UITextField *)field leftImageName:(NSString *)leftImageName{
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 50)];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15, 10, 30, 30);
    imageView.image = [UIImage imageNamed:leftImageName];
    [leftView addSubview:imageView];
//    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
//    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [leftBtn setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
//    leftBtn.frame = CGRectMake(0, 0, 60, 50);
//    [leftView addSubview:leftBtn];
    
    field.leftView = leftView;
    field.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setFieldRightView:(UITextField *)field rightImageName:(NSString *)rightImageName btnTag:(NSInteger)tag{
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width - 60 - 60, 0, 60, 50)];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(15, 10, 30, 30);
    imageView.image = [UIImage imageNamed:rightImageName];
    [rightView addSubview:imageView];

    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(10, 0, 50, 50);
    [rightBtn addTarget:self action:@selector(textFieldRightBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = tag;
    [rightView addSubview:rightBtn];
    if (tag == 1) {
        self.secureTextImageView = imageView;
    }
    
    field.rightView = rightView;
    field.rightViewMode = UITextFieldViewModeAlways;

}
- (void)textFieldRightBtnDidClick:(UIButton *)btn{
    if (btn.tag == 0) {
        self.phoneNumField.text = nil;
    }else if (btn.tag == 1){
        self.pwdField.secureTextEntry = !self.pwdField.secureTextEntry;
        if (self.pwdField.isSecureTextEntry) {
            self.secureTextImageView.image = [UIImage imageNamed:@"013"];
        }else{
            self.secureTextImageView.image = [UIImage imageNamed:@"014"];
        }
    }
}
- (IBAction)loginBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.phoneNumField.text] || [NSObject isBlank:self.pwdField.text]) {
        [MBProgressHUD showToast:@"手机号或密码不能为空"];
        return;
    }
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:self.phoneNumField.text forKey:@"username"];
    [parameters setValue:self.pwdField.text forKey:@"password"];
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] POST:loginUrl parameters:parameters success:^(id responseObject) {
        NSDictionary *data = [ZFGetDataFromResponseTool getData:responseObject];
        NSString *tokenStr = data[@"auth_token"];
        if (data.count > 0 && ![NSObject isBlank:tokenStr]) {
            NSString *refreshTokenStr = data[@"refresh_token"];
            [ZFSaveValueTool saveDefaults:auth_token Value:tokenStr];
            if (![NSObject isBlank:refreshTokenStr]) {
                [ZFSaveValueTool saveDefaults:refresh_token Value:refreshTokenStr];
            }
            [weakself dismissViewControllerAnimated:YES completion:^{
                AppDelegate *myDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                myDelegate.isShowLoginVC = NO;
            }];
        }else{
            [MBProgressHUD showToast:@"获取token失败"];
        }
        
    } failure:^(NSError *error) {
            
    }];
}
- (IBAction)forgotBtnDidClick:(UIButton *)sender {
    ZFForgotPwdGetCodeViewController *vc = [[ZFForgotPwdGetCodeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
