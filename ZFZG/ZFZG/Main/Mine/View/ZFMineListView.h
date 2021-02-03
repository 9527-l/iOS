//
//  ZFMineListView.h
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMineListView : UIView
@property (nonatomic, copy) void (^viewDidClickBlock)(void);
@property (weak, nonatomic) IBOutlet UIView *sepLineView;
- (void) setUIWithImageName:(NSString *)iconName title:(NSString *)title showArrow:(BOOL)showArrow;
@end

NS_ASSUME_NONNULL_END
