//
//  WXLoginShare.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/12.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol WXLoginDelegate <NSObject>

@optional
- (void)wxLoginShareSuccess:(NSDictionary *)dict;


- (void)wxLoginShareFail:(NSDictionary *)dict;


@end


@interface WXLoginShare : NSObject

@property (nonatomic,strong) NSString * kWeiXinRefreshToken;

@property (nonatomic,weak) id <WXLoginDelegate> delegate;


+(WXLoginShare *)shareInstance;


-(BOOL)wxLoginShareRegisterApp;


-(void)WXLogin;


//分享小程序
- (void)WXShareXiaoChengXu:(NSString *)des;


//调用小程序
-(void)WXOpenXiaoChengXu;


//调用微信支付
-(void)WXWeChatPay;


@end
