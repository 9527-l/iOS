//
//  ZFQueryInViewCell.h
//  ZFZG
//
//  Created by Lee on 2021/1/24.
//

#import <UIKit/UIKit.h>
#import "ZFQueryInListModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZFQueryInViewCell : UITableViewCell
@property (nonatomic, assign) NSInteger cellTag;
@property (nonatomic, copy) void(^bottomBtnDidClickBlock)(ZFQueryInListModel *model, NSInteger cellTag);

@property (nonatomic, strong) ZFQueryInListModel *model;
@end

NS_ASSUME_NONNULL_END
