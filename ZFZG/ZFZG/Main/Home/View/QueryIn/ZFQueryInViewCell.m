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

@end

@implementation ZFQueryInViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellTag:(NSInteger)cellTag{
    _cellTag = cellTag;
    UIColor *color = CJColorFromRGBA(220, 160, 104, 1.0);
//    [UIColor colorWithRed:220 green:160 blue:104 alpha:1.0];
    UIColor *color1 = CJColorFromRGBA(35, 100, 190, 1.0);
//    [UIColor colorWithRed:35 green:100 blue:190 alpha:1.0];
    switch (cellTag) {
        case 0:
        {
            [self setBtnTitle:@"完善资料" bottomBtnTitle:@"继续提交" topBtnTitleColor:color bottomBtnTitleColor:color];
        }
            break;
        case 1:
        {
            [self setBtnTitle:@"等待审核" bottomBtnTitle:@"查看详情" topBtnTitleColor:color bottomBtnTitleColor:color];
        }
            break;
        case 2:
        {
            [self setBtnTitle:@"审核通过" bottomBtnTitle:@"查看详情" topBtnTitleColor:color1 bottomBtnTitleColor:color1];
        }
            break;
        case 3:
        {
            [self setBtnTitle:@"审核失败" bottomBtnTitle:@"查看详情" topBtnTitleColor:color1 bottomBtnTitleColor:color1];
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
}
- (IBAction)topBtnDidClick:(UIButton *)sender {
}
- (IBAction)bottomBtnDidClick:(UIButton *)sender {
    if (self.cellTag == 3) {
        if (self.bottomBtnDidClickBlock) {
            self.bottomBtnDidClickBlock();
        }
        
    }
}
@end
