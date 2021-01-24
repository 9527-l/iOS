//
//  ZFQueryInViewCell.h
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFQueryInViewCell : UITableViewCell
@property (nonatomic, assign) NSInteger cellTag;
@property (nonatomic, copy) void(^topBtnDidClickBlock)(void);
@property (nonatomic, copy) void(^bottomBtnDidClickBlock)(void);
@end

NS_ASSUME_NONNULL_END
