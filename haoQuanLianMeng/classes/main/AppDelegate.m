//
//  AppDelegate.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/5/28.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "AppDelegate.h"
#import "LWLaunchViewController.h"
#import "JPUSHService.h"
#import "AdViewController.h"
#import "WXLoginShare.h"
#include <WXApi.h>


//#import <UserNotifications/UserNotifications.h>


// iOS10注册APNs所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif



@interface AppDelegate ()<JPUSHRegisterDelegate>

@end

@implementation AppDelegate


- (void)setUpInit:(NSDictionary *)launchOptions{
    
    // 3.0.0及以后版本注册可以这样写，也可以继续用旧的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];

    
    [JPUSHService setupWithOption:launchOptions appKey:APPJupushKey channel:@"App Store" apsForProduction:Production advertisingIdentifier:nil];
    
    [JPUSHService registrationIDCompletionHandler:^(int resCode, NSString *registrationID) {
        if(resCode == 0){
            NSLog(@"registrationID获取成功：%@",registrationID);
        }
        else{
            NSLog(@"registrationID获取失败，code：%d",resCode);
        }
    }];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    

    [WXApi registerApp:WXAppID];
    
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    self.window.backgroundColor = [UIColor whiteColor];
    LWLaunchViewController * vc = [[LWLaunchViewController alloc] init];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];


    
    

    //注册远程通知
    [self setUpInit:launchOptions];
    
    if (launchOptions) {//是从退出状态进入APP的
        NSDictionary * userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if(userInfo)
        {
            [self logDic:userInfo];
        }
    }
    
    return YES;
}


// 注册App 远程推送
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    
    NSString * rehest  = [JPUSHService registrationID];
    [[NSUserDefaults standardUserDefaults] setObject:rehest forKey:@"registrationID"];
}

//注册远程推送失败
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}






- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [application setApplicationIconBadgeNumber:0];
    

    #ifdef NSFoundationVersionNumber_iOS_9_x_Max
        [[UNUserNotificationCenter currentNotificationCenter] removeAllPendingNotificationRequests];
    #else
        [application cancelAllLocalNotifications];
    #endif
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



- (BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    
    NSLog(@"Calling Application Bundle ID: %@", options[UIApplicationOpenURLOptionsSourceApplicationKey]);
    
    NSLog(@"URL scheme: %@", [url scheme]);
    
    NSLog(@"URL query: %@", [url query]);
    
    [WXApi handleOpenURL:url delegate:(id)[WXLoginShare shareInstance]];
    
    
    return YES;
    
}

#pragma mark- JPUSHRegisterDelegate

- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    
    
    
    // Required
    
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        
        //UNPushNotificationTrigger 远程（通知类型）
        
        [JPUSHService handleRemoteNotification:userInfo];//userInfo消息数据，包含jump。
        
        if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive ) {
            
//            [self jumpToViewctroller:userInfo];
            
            [UIApplication sharedApplication].applicationIconBadgeNumber = 0; //本地消息清0
            
            [JPUSHService setBadge:0];//极光消息清0
            
        }
        
    }
    
    completionHandler();  // 系统要求执行这个方法
    
}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    // Required, iOS 7 Support
    
    [JPUSHService handleRemoteNotification:userInfo];
    
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateInactive ) {
        
//        [self jumpToViewctroller:userInfo];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
        [JPUSHService setBadge:0];
        
    }
    
    completionHandler(UIBackgroundFetchResultNewData);
    
    
    
}



//#ifdef NSFoundationVersionNumber_iOS_9_x_Max
//#pragma mark- JPUSHRegisterDelegate
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
//    NSDictionary * userInfo = notification.request.content.userInfo;
//    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        [self logDic:userInfo];
//        [JPUSHService handleRemoteNotification:userInfo];
//    }
//    else {
//        // 判断为本地通知
//        LWLog(@"iOS10 前台收到本地通知");
//    }
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以设置
//}
//
//- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
//    NSDictionary * userInfo = response.notification.request.content.userInfo;
//    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
//        [self logDic:userInfo];
//        [JPUSHService handleRemoteNotification:userInfo];
//        //NSLog(@"iOS10 收到远程通知:%@", [self logDic:userInfo]);
//    }
//    else {
//        // 判断为本地通知
//        NSLog(@"iOS10 收到本地通");
//    }
//    completionHandler();  // 系统要求执行这个方法
//}
//#else
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//
//    [self logDic:userInfo];
//    // Required, iOS 7 Support
//    [JPUSHService handleRemoteNotification:userInfo];
//    completionHandler(UIBackgroundFetchResultNewData);
//}
//#endif


- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    
    
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertController * aler = [UIAlertController alertControllerWithTitle:@"sdasd" message:[dic mj_JSONString] preferredStyle:UIAlertControllerStyleAlert];
    [aler addAction:action];
    [self.window.rootViewController presentViewController:aler animated:YES completion:^{
        
    }];
    
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str = [NSPropertyListSerialization propertyListWithData:tempData options:NSPropertyListImmutable format:nil error:nil];

    return str;
}


@end
