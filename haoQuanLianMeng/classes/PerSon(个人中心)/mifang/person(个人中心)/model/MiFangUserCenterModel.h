//
//  MiFangUserCenterModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/27.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiFangUserCenterModel : NSObject

@property (nonatomic,strong) NSArray<NSString *> * ADList;
//售后订单数
@property (nonatomic,strong)NSString * AftermarketCount;
@property (nonatomic,strong)NSString * ExpireTime;
@property (nonatomic,strong)NSString * LevelName;
//待发货订单数
@property (nonatomic,strong)NSString * UnDeliverCount;
//待收货订单数
@property (nonatomic,strong)NSString * UnSendCount;
//用户明
@property (nonatomic,strong)NSString * UserName;
@property (nonatomic,strong)NSString * WxHeadImg;
@property (nonatomic,strong)NSString * WxNickName;
//剩余天数
@property (nonatomic,assign) int SurplusDays;
//用户积分
@property (nonatomic,assign) int UserIntegral;
@property (nonatomic,assign) int UserTempIntegral;
//觅豆
@property (nonatomic,assign) int UserMBean;
@end
