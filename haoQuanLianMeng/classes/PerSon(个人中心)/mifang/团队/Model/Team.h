//
//  Team.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/4.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TeamInfoModel.h"

@interface Team : NSObject

@property (nonatomic,assign) int  BelongOneNumByToday;
@property (nonatomic,assign) int  BelongTwoNumByToday;
@property (nonatomic,assign) int  BelongOneNumByMonth;
@property (nonatomic,assign) int  BelongTwoNumByMonth;

@property (nonatomic,strong) NSArray <TeamInfoModel *>*TeamInfo;

@end
