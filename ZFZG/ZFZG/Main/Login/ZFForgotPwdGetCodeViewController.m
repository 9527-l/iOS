//
//  ZFForgotPwdGetCodeViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/25.
//

#import "ZFForgotPwdGetCodeViewController.h"
#import "ZFForgotPwdInputViewController.h"
@interface ZFForgotPwdGetCodeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (assign, nonatomic) BOOL isTimer;
@end

@implementation ZFForgotPwdGetCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"忘记密码";
    self.codeBtn.layer.cornerRadius = 8;
    self.codeBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.cornerRadius = 8;
    self.sureBtn.layer.masksToBounds = YES;
}
- (IBAction)codeBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.phoneField.text]) {
        [MBProgressHUD showToast:@"请输入手机号"];
        return;
    }
//        请求接口，成功则计时，失败则提示
    [self countDown];
}
- (IBAction)sureBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.phoneField.text] || [NSObject isBlank:self.codeField.text]) {
        [MBProgressHUD showToast:@"请输入手机号或验证码"];
        return;
    }
    ZFForgotPwdInputViewController *vc = [[ZFForgotPwdInputViewController alloc] init];
    vc.phoneNum = self.phoneField.text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)countDown {
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    self.codeBtn.userInteractionEnabled = NO;
    
    dispatch_source_set_event_handler(_timer, ^{
        if (timeout<=0) { //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.codeBtn.userInteractionEnabled = YES;
            });
        } else {
            
            int seconds = timeout % 61;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
//                改变文字
                [self.codeBtn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                //To do
                [UIView commitAnimations];
            });
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
}
@end
