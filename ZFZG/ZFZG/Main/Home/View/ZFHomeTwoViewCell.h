//
//  ZFHomeTwoViewCell.h
//  ZFZG
//
//  Created by Lee on 2021/1/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFHomeTwoViewCell : UITableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UILabel *countLab;
@end

NS_ASSUME_NONNULL_END
