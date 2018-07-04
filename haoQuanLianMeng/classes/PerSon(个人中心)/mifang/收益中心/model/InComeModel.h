//
//  InComeModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/3.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InComeModel : NSObject


@property (nonatomic,assign) int UserIntegral;
@property (nonatomic,assign) int UserOrderNumByLastMonth;
@property (nonatomic,assign) int UserOrderNumByLastWeek;
@property (nonatomic,assign) int UserOrderNumByMonth;
@property (nonatomic,assign) int UserOrderNumByToday;
@property (nonatomic,assign) int UserOrderNumByWeek;
@property (nonatomic,assign) int UserOrderNumByYesterday;
@property (nonatomic,assign) int UserProfitByLastMonth;
@property (nonatomic,assign) int UserProfitByLastWeek;
@property (nonatomic,assign) int UserProfitByMonth;

@property (nonatomic,assign) int UserProfitByToday;
@property (nonatomic,assign) int UserProfitByWeek;
@property (nonatomic,assign) int UserProfitByYesterday;
@property (nonatomic,assign) int UserTempIntegral;



@end
