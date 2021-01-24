//
//  ZFLoginViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFLoginViewController.h"

@interface ZFLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneNumField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPwdBtn;

@end

@implementation ZFLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFieldLeftView:self.phoneNumField leftImageName:@""];
    [self setFieldRightView:self.phoneNumField rightImageName:@""];
    [self setFieldLeftView:self.pwdField leftImageName:@""];
    [self setFieldRightView:self.pwdField rightImageName:@""];
    
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
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"左" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(10, 0, 50, 50);
    [leftView addSubview:leftBtn];
    
    field.leftView = leftView;
    field.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setFieldRightView:(UITextField *)field rightImageName:(NSString *)rightImageName{
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(Screen_Width - 60 - 60, 0, 60, 50)];
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"右" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(10, 0, 50, 50);
    [rightView addSubview:rightBtn];
    
    field.rightView = rightView;
    field.rightViewMode = UITextFieldViewModeAlways;

}

- (IBAction)loginBtnDidClick:(UIButton *)sender {
}
- (IBAction)forgotBtnDidClick:(UIButton *)sender {
}

@end
