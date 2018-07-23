
//
//  HTNetworkingTool.m
//  fanmore---
//
//  Created by lhb on 15/5/21.
//  Copyright (c) 2015年 HT. All rights reserved.
//

#import "HTNetworkingTool.h"
#import "HTTool.h"
#import "MBProgressHUD.h"


//YYCache缓存文件存放的文件夹
NSString * const HttpCache = @"HttpRequestCache";



@interface HTNetworkingTool()
@property(nonatomic, strong)  YYCache * requestCache;
@end



@implementation HTNetworkingTool

static HTNetworkingTool * _HTNetworkingTool;

+ (instancetype)HTNetworkingManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _HTNetworkingTool = [[self alloc] init];
        
    });
    return _HTNetworkingTool;
}

- (instancetype)init{
    if (self = [super init]) {
        //设置YYCache属性
        _requestCache = [[YYCache alloc] initWithName:HttpCache];
        _requestCache.memoryCache.shouldRemoveAllObjectsOnMemoryWarning = YES;
        _requestCache.memoryCache.shouldRemoveAllObjectsWhenEnteringBackground = YES;
    }
    return self;
}




/*账户网络请求Get*/
- (void)HTNetworkingToolGet:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud isHaseCache:(BOOL)caches success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager HTAFHTTPSessionShare];
    NSString * url = [HTMainIpAddress stringByAppendingPathComponent:urlStr];
    if (isHud) { // 是否显示loading
        [SVProgressHUD showWithStatus:nil];
    }
    
    
    if ([[HTTool HTToolShare] requestBeforeJudgeConnect]) {
        NSLog(@"\\n\\n----%@------\\n\\n",@"没有网络");
        if (caches) {
            id cacheData = [_requestCache objectForKey:urlStr];
            if(cacheData!=nil)
            {
                success(cacheData);
                return ;
            }
        }
    }
    
    LWLog(@"api url %@",url);
    [manager GET:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",task);
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        //LWLog(@"%@",json);
        LWLog(@"%@",task);
        if([[responseObject objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[responseObject objectForKey:@"resultMsg"]];
        }else{
            
            if (caches) {
                //保存缓存
                [_requestCache setObject:responseObject forKey:urlStr];
            }
            
            //LWLog(@"%@",json);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [SVProgressHUD dismiss];
        if(failure){
           failure(error);
        }
        
    }];
}

- (void)showLogin:(NSString *)alertStr{

//    AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
//    [[HTTool HTToolShare] showAlertWithController:appDelegate.currentVC andTitle:@"账号提示" andMessage:alertStr conform:^{
//        LoginViewController * login = [[LoginViewController alloc] init];
//        HTNavigationController * nav = [[HTNavigationController alloc] initWithRootViewController:login];
//        AppDelegate * appDelegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
//        [[AFHTTPSessionManager manager] invalidateSessionCancelingTasks:YES];
//        [appDelegate.currentVC presentViewController:nav animated:YES completion:nil];
//
//
//    } cancle:nil];
}

- (void)HTNetworkingToolPost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud isHaseCache:(BOOL)caches success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    NSString * url = [HTMainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager HTAFHTTPSessionShare];
    
    LWLog(@"api url %@",url);
    if (isHud) { // 是否显示loading
       [MBProgressHUD showMessage:nil];
    }
    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        LWLog(@"%@",task);
        [MBProgressHUD hideHUD];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            success(responseObject);
        }else if([[responseObject objectForKey:@"code"] integerValue] == 4003){
            [self showLogin:[responseObject objectForKey:@"resultMsg"]];
            failure(nil);
        }else{
            [MBProgressHUD showError:[responseObject objectForKey:@"msg"]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [MBProgressHUD hideHUD];
        [MBProgressHUD showError:@"服务错误"];
        failure(error);
    }];
}

- (void)HTNetworkingGetAppleServicePost:(NSString *)urlStr parame:(NSMutableDictionary *)params isHud:(BOOL)isHud success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    //NSString * url = [MainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    
    //LWLog(@"api url %@",url);
    if (isHud) { // 是否显示loading
        [SVProgressHUD showWithStatus:nil];
    }
    [manager POST:urlStr parameters:[[HTTool HTToolShare] HTToolSignWithParame:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        LWLog(@"%@",task);
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
            [self showLogin:[json objectForKey:@"resultMsg"]];
        }else{
            LWLog(@"%@",json);
            success(json);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        LWLog(@"%@",error);
        [SVProgressHUD dismiss];
        failure(error);
    }];
}



- (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(IDModel *)modele success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
//    NSString * url = [HTMainIpAddress stringByAppendingPathComponent:urlStr];
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
//    [SVProgressHUD showWithStatus:@"资料上传中"];
//    NSMutableDictionary * dict = [NSMutableDictionary dictionary];

//    dict[@"name"] = [modele.name copy];
//    dict[@"cardNo"] = [modele.cardNo copy];
//    dict[@"gender"] = @(modele.gender);
//    dict[@"nation"] = [modele.nation copy];
//    dict[@"address"] = [modele.address copy];
//    dict[@"birth"] = [modele.birth copy];
//    dict[@"duration"] = [modele.duration copy];
//    dict[@"authority"] = [modele.authority copy];
// 
//    
//    
//    LWLog(@"%@-----%@",modele.frontSideFile,modele.backSideFile);
//    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:dict] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//        NSData * imageData = UIImagePNGRepresentation([[HTTool HTToolShare] scaleImage:modele.frontSideFile sclae:0.1]);
//        // 上传的参数名
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str = [formatter stringFromDate:[NSDate date]];
//        NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
//        [formData appendPartWithFileData:imageData name:@"frontSideFile" fileName:fileName mimeType:@"image/png"];
//        
//        
//        
//        NSData * imageData1 = UIImagePNGRepresentation([[HTTool HTToolShare] scaleImage:modele.backSideFile sclae:0.1]);
//        // 上传的参数名
//        NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
//        formatter.dateFormat = @"yyyyMMddHHmmss";
//        NSString *str1 = [formatter1 stringFromDate:[NSDate date]];
//        NSString *fileName1 = [NSString stringWithFormat:@"%@.png", str1];
//        [formData appendPartWithFileData:imageData1 name:@"backSideFile" fileName:fileName1 mimeType:@"image/png"];
//        
//        
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [SVProgressHUD dismiss];
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
//            [self showLogin:[json objectForKey:@"resultMsg"]];
//        }else{
//            LWLog(@"%@",json);
//            success(json);
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [SVProgressHUD dismiss];
//       failure(error);
//    }];

}

- (void)HTNetworkingToolPostFile:(NSString *)urlStr parame:(NSMutableDictionary *)modele andImages:(NSArray <UIImage *>*)images andImageParameName:(NSString *)iconName success:(void (^)(id json))success failure:(void (^)(NSError *error))failure{
    
    NSString * url = [HTMainIpAddress stringByAppendingPathComponent:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager * manager = [HTAFHTTPSessionManager manager];
    [SVProgressHUD showWithStatus:@"资料上传中"];
    
    [manager POST:url parameters:[[HTTool HTToolShare] HTToolSignWithParame:modele] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (int i = 0; i < images.count; i++) {
        
            UIImage * upLoadImage =  [images objectAtIndex:i];
            NSData * imageData = UIImagePNGRepresentation(upLoadImage);
            // 上传的参数名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            [formData appendPartWithFileData:imageData name:@"" fileName:fileName mimeType:@"image/png"];
        }
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
//        NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        if([[json objectForKey:@"resultCode"] integerValue] == 4003){
//            [self showLogin:[json objectForKey:@"resultMsg"]];
//        }else{
//            LWLog(@"%@",json);
//            success(json);
//        }
        
        if ([[responseObject objectForKey:@"code"] integerValue] == 200) {
            success(responseObject);
        }else if([[responseObject objectForKey:@"code"] integerValue] == 4003){
            [self showLogin:[responseObject objectForKey:@"resultMsg"]];
            failure(nil);
        }else{
            [MBProgressHUD showError:[responseObject objectForKey:@"msg"]];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        failure(error);
    }];
    
}

//#pragma mark  网络判断
//+ (BOOL)requestBeforeJudgeConnect
//{
//    struct sockaddr zeroAddress;
//    bzero(&zeroAddress, sizeof(zeroAddress));
//    zeroAddress.sa_len = sizeof(zeroAddress);
//    zeroAddress.sa_family = AF_INET;
//    SCNetworkReachabilityRef defaultRouteReachability =
//    SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    BOOL didRetrieveFlags =
//    SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    if (!didRetrieveFlags) {
//        printf("Error. Count not recover network reachability flags\\n");
//        return NO;
//    }
//    BOOL isReachable = flags & kSCNetworkFlagsReachable;
//    BOOL needsConnection = flags & kSCNetworkFlagsConnectionRequired;
//    BOOL isNetworkEnable  =(isReachable && !needsConnection) ? YES : NO;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIApplication sharedApplication].networkActivityIndicatorVisible =isNetworkEnable;/*  网络指示器的状态： 有网络 ： 开  没有网络： 关  */
//    });
//    return isNetworkEnable;
//}
@end
