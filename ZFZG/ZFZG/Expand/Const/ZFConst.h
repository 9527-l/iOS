//
//  ZFConst.h
//  ZFZG
//
//  Created by Lee on 2020/11/18.
//

#ifndef ZFConst_h
#define ZFConst_h
/*
 ************* 项目环境配置 *************
 */
#define HOST_TYPE 0  //0开发  1灰度  2正式
#if HOST_TYPE == 0
#define kHOSTURL @"测试地址"
#elif HOST_TYPE == 1
#define kHOSTURL @"预发地址"
#elif HOST_TYPE == 2
#define kHOSTURL @"正式地址"
#endif













#endif /* ZFConst_h */





