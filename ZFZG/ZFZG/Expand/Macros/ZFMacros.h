//
//  ZFMacros.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#ifndef ZFMacros_h
#define ZFMacros_h

/*
 弱引用/强引用
 */
#define WeakSelf(type)    __weak typeof(type) weak##type = type;
#define StrongSelf(type)  __strong typeof(type) type = weak##type;

// 尺寸
#define Screen_Width          ([UIScreen mainScreen].bounds.size.width)
#define Screen_Height         ([UIScreen mainScreen].bounds.size.height)

#endif /* ZFMacros_h */
