//
//  MiFangYaoQingModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/10.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiFangYaoQingModel : NSObject

@property (nonatomic,copy) NSString * UserNickName;
@property (nonatomic,copy) NSString * UserLevelName;
@property (nonatomic,copy) NSString * UserHeadImgURL;
//剩余帐号数
@property (nonatomic,assign) int SurplusNum;
//收益金额
@property (nonatomic,assign) double ProfitAmount;
//是否代理商
@property (nonatomic,assign) bool IsAgent;
//邀请人数
@property (nonatomic,assign) int InvitationMemberNum;
//等级Id
@property (nonatomic,assign) int LevelId;



//购买帐号
@property (nonatomic,copy) NSString * BuyBuddyNumURL;


@property (nonatomic,copy) NSString * UpgradeAgentURL; // string    邀请好友升级代理商地址


@property (nonatomic,copy) NSString * ApplyAgentURL; // string    邀请好友升级代理


@end
