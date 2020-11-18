//
//  ZFMineListModel.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZFMineListModel : NSObject
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isShowArrow;
@end

NS_ASSUME_NONNULL_END
