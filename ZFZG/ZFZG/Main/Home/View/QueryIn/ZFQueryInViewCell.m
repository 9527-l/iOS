//
//  ZFQueryInViewCell.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFQueryInViewCell.h"

@interface ZFQueryInViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *topLab;
@property (weak, nonatomic) IBOutlet UILabel *bottomLab;
@property (weak, nonatomic) IBOutlet UIButton *topBtn;
@property (weak, nonatomic) IBOutlet UIButton *bottomBtn;
@property (weak, nonatomic) IBOutlet UILabel *msgLab;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *msgTopCon;

@end

@implementation ZFQueryInViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellTag:(NSInteger)cellTag{
    _cellTag = cellTag;
    UIColor *color = CJColorFromRGBA(220, 160, 104, 1.0);
    UIColor *color1 = CJColorFromRGBA(35, 100, 190, 1.0);
    UIColor *color2 = CJColorFromRGBA(210, 62, 65, 1.0);
    self.topBtn.userInteractionEnabled = YES;
    self.bottomBtn.userInteractionEnabled = YES;
    switch (cellTag) {
        case 0:
        {
            [self setBtnTitle:@"完善资料" bottomBtnTitle:@"继续提交" topBtnTitleColor:color bottomBtnTitleColor:color];
        }
            break;
        case 1:
        {
            [self setBtnTitle:@"提交中" bottomBtnTitle:@"请等待" topBtnTitleColor:color bottomBtnTitleColor:color];
            self.topBtn.userInteractionEnabled = false;
            self.bottomBtn.userInteractionEnabled = false;

        }
            break;
        case 2:
        {
            [self setBtnTitle:@"审核通过" bottomBtnTitle:@"查看详情" topBtnTitleColor:color1 bottomBtnTitleColor:color1];
        }
            break;
        case 3:
        {
            [self setBtnTitle:@"审核失败" bottomBtnTitle:@"修改提交" topBtnTitleColor:color2 bottomBtnTitleColor:color2];
        }
            break;
        default:
            break;
    }
}
- (void)setBtnTitle:(NSString *)topBtnTitle bottomBtnTitle:(NSString *)bottomBtnTitle topBtnTitleColor:(UIColor *)topBtnTitleColor bottomBtnTitleColor:(UIColor *)bottomBtnTitleColor{
    [self.topBtn setTitle:topBtnTitle forState:UIControlStateNormal];
    [self.topBtn setTitleColor:topBtnTitleColor forState:UIControlStateNormal];
    
    [self.bottomBtn setTitle:bottomBtnTitle forState:UIControlStateNormal];
    [self.bottomBtn setTitleColor:bottomBtnTitleColor forState:UIControlStateNormal];
}

- (void)setModel:(ZFQueryInListModel *)model{
    _model = model;
    self.topLab.text = model.outer_mer_name;
    self.bottomLab.text = model.updated_at;
    self.msgLab.text = model.error_msg;
    if (model.error_msg.length == 0) {
        self.msgTopCon.constant = 0;
    }else{
        self.msgTopCon.constant = 5;
    }
}

- (IBAction)btnDidClick:(UIButton *)sender {
    if (self.bottomBtnDidClickBlock) {
        self.bottomBtnDidClickBlock(self.model, self.cellTag);
    }

}
@end
