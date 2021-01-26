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

@end

@implementation ZFForgotPwdInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sureBtn.layer.cornerRadius = 8;
    self.sureBtn.layer.masksToBounds = YES;

}
-(void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"忘记密码";
}
- (IBAction)sureBtnDidClick:(UIButton *)sender {
    
}

@end
