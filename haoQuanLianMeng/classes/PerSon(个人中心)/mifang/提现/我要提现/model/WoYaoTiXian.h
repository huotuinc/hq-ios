//
//  WoYaoTiXian.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/6/29.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WoYaoTiXian : NSObject


@property (nonatomic,assign) int AccountId;
@property (nonatomic,copy) NSString * AccountInfo;

//当月还可提现次数
@property (nonatomic,assign) int MonthCount;

//起提金额
@property (nonatomic,strong) NSNumber *  BaseMoney;
//最低手续费
@property (nonatomic,strong) NSNumber *  Handling;
//手续费率
@property (nonatomic,strong) NSNumber *  HandlingRate;
//可提现积分
@property (nonatomic,strong) NSNumber *  UserIntegral;

@property (nonatomic,copy) NSString * UserRealName;

@end
