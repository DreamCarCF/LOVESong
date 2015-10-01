//
//  HttpRequestManager.h
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^httpRequestSuccess)(id responseObj);
typedef void (^httpRequestFailure)(NSError *error);
@interface HttpRequestManager : NSObject
//为了方便在任何地方发起网络请求,将它做成单例
+(instancetype)shareInstance;

//数据请求接口
-(void)getLimitInfoByPage:(int)page tag:(int)tag success:(httpRequestSuccess)success failure:(httpRequestFailure)failure;
@end
