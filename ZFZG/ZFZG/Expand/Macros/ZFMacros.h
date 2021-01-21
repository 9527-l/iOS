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

#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhoneX kScreenWidth >= 375.0f && kScreenHeight >= 812.0f && kIs_iphone
 

/*状态栏高度*/
#define kStatusBarHeight (CGFloat)(kIs_iPhoneX?(44.0):(20.0))
/*导航栏高度*/
#define kNavBarHeight (44)
/*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX?(88.0):(64.0))
/*TabBar高度*/
#define kTabBarHeight (CGFloat)(kIs_iPhoneX?(49.0 + 34.0):(49.0))
/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX?(44.0):(0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX?(24.0):(0))
/*导航条和Tabbar总高度*/
#define kNavBarAndStatusBarAndTabBarHeight (kNavBarAndStatusBarHeight + kTabBarHeight)


//颜色
#define MainColorBlue CJColorFromRGBA(27, 113, 223, 1)

#endif /* ZFMacros_h */
