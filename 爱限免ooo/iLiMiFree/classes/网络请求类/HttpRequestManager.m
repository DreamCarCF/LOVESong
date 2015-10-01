//
//  HttpRequestManager.m
//  iLiMiFree
//
//  Created by Flying meat on 9/1/15.
//  Copyright (c) 2015 CaoFeng. All rights reserved.
//

#import "HttpRequestManager.h"
#import "AllInterFace.h"
#import "AFNetworking.h"
@implementation HttpRequestManager
+(instancetype)shareInstance
{
    
    static HttpRequestManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        manager=[[HttpRequestManager alloc]init];
    });
    return manager;
    
}
-(void)getLimitInfoByPage:(int)page tag:(int)tag success:(httpRequestSuccess)success failure:(httpRequestFailure)failure
{
    NSString *urlString=nil;
    
    switch (tag) {
        case 10:
        {
           //限免
            urlString=[NSString stringWithFormat:LimitFreeURL,page];
        }
            break;
        case 11:
        {
            //降价
            urlString=[NSString stringWithFormat:ReduceURL,page];
        }
            break;
        case 12:
        {
            //免费
            urlString=[NSString stringWithFormat:FreeURL,page];
        }
            break;
            
        default:
            break;
    }

    AFHTTPRequestOperationManager*manager=[AFHTTPRequestOperationManager manager];
    //发起网络请求
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        //成功,就走成功回调
//        NSLog(@"responseObject==%@",responseObject);
        
        NSArray*resultArray=responseObject[@"applications"];
        //回传结果数组
        success(resultArray);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     //如果失败,走失败的回调
        failure(error);


    }];
}
@end
