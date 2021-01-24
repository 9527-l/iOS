//
//  ZFMineHeaderView.h
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMineHeaderView : UIView
@property (nonatomic, copy) void (^viewDidClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
