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


@end
