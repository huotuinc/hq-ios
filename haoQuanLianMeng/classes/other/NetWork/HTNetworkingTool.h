//
//  UserLoginTool.h
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IDModel;



@interface HTNetworkingTool : NSObject


//+ (instancetype)HTNetworkingShare;

+ (instancetype)HTNetworkingManager;


/*账户网络请求Get*/
+ (void)HTNetworkingToolGet:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud isHaseCache:(BOOL)caches success:(void (^)(id json))success failure:(void (^)(NSError *error))failure ;

+ (void)HTNetworkingToolPost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud isHaseCache:(BOOL)caches success:(void (^)(id json))success failure:(void (^)(NSError *error))failure ;

+ (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(IDModel *)modele success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;


+ (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(NSMutableDictionary *)modele andImages:(NSArray *)images andImageParameName:(NSString *)iconName success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

+ (void)HTNetworkingGetAppleServicePost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;

@end
