//
//  ZFBusinessInfoViewCell.m
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import "ZFBusinessInfoViewCell.h"

@interface ZFBusinessInfoViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *leftLab;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end

@implementation ZFBusinessInfoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(ZFBusinessListModel *)model{
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.iconImageName];
    self.leftLab.text = model.leftStr;
    self.rightLab.text = model.rightStr;
}
@end
