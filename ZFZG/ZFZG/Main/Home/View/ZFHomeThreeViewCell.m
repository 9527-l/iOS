//
//  ZFHomeThreeViewCell.m
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import "ZFHomeThreeViewCell.h"

@implementation ZFHomeThreeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addUserBtnDidClick:(UIButton *)sender {
    if (self.btnDidClickBlock) {
        self.btnDidClickBlock();
    }
}

@end
