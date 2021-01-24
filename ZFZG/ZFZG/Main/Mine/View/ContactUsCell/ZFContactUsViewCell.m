//
//  ZFContactUsViewCell.m
//  ZFZG
//
//  Created by Lee on 2021/1/23.
//

#import "ZFContactUsViewCell.h"

@interface ZFContactUsViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftLab;
@property (weak, nonatomic) IBOutlet UILabel *rightLab;

@end


@implementation ZFContactUsViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    switch (indexPath.section) {
        case 0:
        {
            self.leftLab.text = @"服务商名称 : ";
            self.rightLab.text = @"中付支付";
        }
            break;
        case 1:
        {
            self.leftLab.text = @"服务商电话 : ";
            self.rightLab.text = @"4007006889";
        }
            break;
        default:
            break;
    }
}
@end
