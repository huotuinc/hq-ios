//
//  HTAFHTTPSessionManager.m
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import "HTAFHTTPSessionManager.h"


@implementation HTAFHTTPSessionManager

static HTAFHTTPSessionManager * _HTAFHTTPSessionManager;



+ (instancetype)HTAFHTTPSessionShare{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _HTAFHTTPSessionManager = [[super alloc] init];
        [_HTAFHTTPSessionManager.securityPolicy setAllowInvalidCertificates:YES];
        _HTAFHTTPSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
//        _HTAFHTTPSessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        _HTAFHTTPSessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/json",@"text/html",@"application/json", @"text/plain", nil];
        _HTAFHTTPSessionManager.requestSerializer.timeoutInterval = 30;
        // 开始设置请求头
        [_HTAFHTTPSessionManager.requestSerializer setValue:AppVersion forHTTPHeaderField:@"appVersion"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:UUIDString forHTTPHeaderField:@"hwid"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:[[HTTool HTToolShare] HTToolGetIphoneType] forHTTPHeaderField:@"mobileType"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:@"2" forHTTPHeaderField:@"osType"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:OSVersion forHTTPHeaderField:@"osVersion"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:ServiceMerchantId forHTTPHeaderField:@"customerId"];
    });
    HTUserModel * usermodel = (HTUserModel *)[HTToolShareManager HTToolUnArchiveObject:@"HTUserModel"];
//    NSString * tt =  [[NSUserDefaults standardUserDefaults] objectForKey:@"registrationID"];
//    [_HTAFHTTPSessionManager.requestSerializer setValue:tt forHTTPHeaderField:@"hwid"];
    if(usermodel == nil){
        [_HTAFHTTPSessionManager.requestSerializer setValue:@"" forHTTPHeaderField:@"userToken"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:@"0" forHTTPHeaderField:@"userId"];
    }else{
        [_HTAFHTTPSessionManager.requestSerializer setValue:usermodel.token forHTTPHeaderField:@"userToken"];
        [_HTAFHTTPSessionManager.requestSerializer setValue:[NSString stringWithFormat:@"%d",usermodel.userId] forHTTPHeaderField:@"userId"];
    }
    return _HTAFHTTPSessionManager;
}
@end
