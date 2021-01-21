//
//  UIImage+Scale.h
//  ZFZG
//
//  Created by Lee on 2021/1/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Scale)
+ (UIImage *) createNewImage:(UIImage *)image multiple:(CGFloat)multiple;
@end

NS_ASSUME_NONNULL_END
