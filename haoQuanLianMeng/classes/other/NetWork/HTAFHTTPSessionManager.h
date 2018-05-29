//
//  HTAFHTTPSessionManager.h
//  HotTechLoan
//
//  Created by 罗海波 on 2017/11/9.
//  Copyright © 2017年 HT. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#define  HTAFHTTPSessionShareManager [HTAFHTTPSessionManager HTAFHTTPSessionShare]


@interface HTAFHTTPSessionManager : AFHTTPSessionManager


+ (instancetype)HTAFHTTPSessionShare;


@end
