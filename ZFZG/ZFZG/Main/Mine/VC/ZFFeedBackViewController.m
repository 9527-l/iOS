//
//  ZFFeedBackViewController.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFFeedBackViewController.h"
#import "CJTextView.h"
@interface ZFFeedBackViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *contentTitleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentCountLab;
@property (strong, nonatomic) CJTextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *commitBtn;
@end

@implementation ZFFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTextView];
    self.commitBtn.layer.cornerRadius = 8;
    self.commitBtn.layer.masksToBounds = YES;
}

- (void)setNavBarView{
    [super setNavBarView];
    self.navigationItem.title = @"意见反馈";
}
- (void)addTextView{
    [self.contentView insertSubview:self.textView atIndex:0];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentTitleLab.mas_right).offset(10);
        make.top.equalTo(self.contentTitleLab).offset(-8);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-30);
    }];
}
- (IBAction)commitBtnDidClick:(UIButton *)sender {
    if ([NSObject isBlank:self.titleField.text] || [NSObject isBlank:self.textView.text]) {
        [MBProgressHUD showToast:@"标题或内容不能为空！"];
        return;
    }
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:2];
    [parameters setValue:self.titleField.text forKey:@"title"];
    [parameters setValue:self.textView.text forKey:@"content"];
    WeakSelf(self);
    [[BasicNetWorking sharedSessionManager] POST:manageAddadvise parameters:parameters success:^(id responseObject) {
        [MBProgressHUD showToast:@"提交成功"];
        [weakself.navigationController popViewControllerAnimated:NO];
    } failure:^(NSError *error) {
        
    }];

}

- (void)textViewDidChange:(UITextView *)textView{
    NSInteger count = textView.text.length;
    if (count > 240) {
        count = 240;
    }
    self.contentCountLab.text = [NSString stringWithFormat:@"%zd/240", count];
}

- (CJTextView *)textView{
    if (!_textView) {
        _textView = [[CJTextView alloc] init];
        _textView.placeholder = @"请输入不少于10字的描述";
        _textView.layer.borderWidth = 0;
        _textView.delegate = self;
        _textView.limitedNumber = 240;
        _textView.font = [UIFont systemFontOfSize:16];
    }
    return _textView;
}
@end
