//
//  ZFMineHeaderView.m
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import "ZFMineHeaderView.h"

@interface ZFMineHeaderView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *codeLab;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabTopCon;

@end

@implementation ZFMineHeaderView

- (instancetype)init{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
        self.titleLabTopCon.constant = kStatusBarHeight;
    }
    return  self;
}
- (IBAction)viewDidClick:(UIButton *)sender {
    if (self.viewDidClickBlock) {
        self.viewDidClickBlock();
    }
}

@end
