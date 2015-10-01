//
//  AllInterFace.h
//  IFreeApp
//
//  Created by qianfeng on 15/1/7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//  

#ifndef IFreeApp_AllInterFace_h
#define IFreeApp_AllInterFace_h

// 限免接口
/*
 参数: 
    page:当前页
 */
#define LimitFreeURL @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=%d"

// 限免详情
/* 参数:
    应用Id（applicationId）
 */
#define AppDetailURL @"http://iappfree.candou.com:8080/free/applications/%@"

// 限免详情-附近的应用
#define NearByURL @"http://iappfree.candou.com:8080/free/applications/recommend?longitude=116.344539&latitude=40.034346"

// 降价
/*
 参数:
 page:当前页
 */
#define ReduceURL @"http://iappfree.candou.com:8080/free/applications/sales?currency=rmb&page=%d"

// 免费
/*
 参数:
 page:当前页
 */
#define FreeURL @"http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=%d"

//// 专题
//#define SpecialURL @"http://iappfree.candou.com:8080/free/special?page=%d"
//
//// 热榜
//#define HotListURL @"http://open.candou.com/mobile/hot/page/"



#endif
