//
//  ZFMineListView.m
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import "ZFMineListView.h"


@interface ZFMineListView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIView *sepLineView;
@end

@implementation ZFMineListView
- (instancetype)init{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
    }
    return  self;
}
- (void)setUIWithImageName:(NSString *)iconName title:(NSString *)title showArrow:(BOOL)showArrow{
    self.titleLab.text = title;
    self.arrowImageView.hidden = !showArrow;
    if (iconName.length != 0) {
        self.iconImageView.image = [UIImage imageNamed:iconName];
    }
}
- (IBAction)viewDidCilck:(UIButton *)sender {
    if (self.viewDidClickBlock) {
        self.viewDidClickBlock();
    }
}

@end
