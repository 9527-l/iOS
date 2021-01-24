//
//  ZFBusinessRegistrationViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBusinessRegistrationViewController.h"

@interface ZFBusinessRegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *posSNCodeField;
@property (weak, nonatomic) IBOutlet UITextField *businessNameField;
@property (weak, nonatomic) IBOutlet UITextField *businessPhoneField;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@property (weak, nonatomic) IBOutlet UIButton *skipBtn;

@end

@implementation ZFBusinessRegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"商户登记";
}
- (IBAction)scanBtnDidClick:(UIButton *)sender {
}
- (IBAction)commitBtnDidClick:(UIButton *)sender {
}
- (IBAction)skipBtnDidClick:(UIButton *)sender {
}

@end
