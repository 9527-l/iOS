//
//  ZFHomeTwoViewCell.m
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import "ZFHomeTwoViewCell.h"

@interface ZFHomeTwoViewCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@end

@implementation ZFHomeTwoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.bgView.layer.cornerRadius = 8;
    self.bgView.layer.masksToBounds = YES;
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    NSInteger row = indexPath.row;
    NSString *iconName = @"";
    NSString *title = @"";
    switch (row) {
        case 1:
        {
            iconName = @"2";
            title = @"审核通过";
        }
            break;
        case 2:
        {
            iconName = @"3";
            title = @"审核中";
        }
            break;
        case 3:
        {
            iconName = @"4";
            title = @"审核驳回";
        }
            break;
        case 4:
        {
            iconName = @"5";
            title = @"待完善资料";
        }
            break;
        default:
            break;
    }
    self.iconImageView.image = [UIImage imageNamed:iconName];
    self.titleLab.text = title;
}

@end
