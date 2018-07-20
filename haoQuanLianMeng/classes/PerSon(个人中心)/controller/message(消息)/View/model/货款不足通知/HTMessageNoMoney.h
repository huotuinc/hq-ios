//
//  HTMessageNoMoney.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageModel.h"

@interface HTMessageNoMoney : HTMessageModel


/// <summary>
/// 通知类型
/// </summary>
@property (nonatomic,assign) int NoticeType;
/// <summary>
/// 通知场景
/// </summary>
@property (nonatomic,assign) int  NoticeScene;
/// <summary>
/// 通知时间
/// </summary>
@property (nonatomic,copy) NSString * NoticeTime;
/// <summary>
/// 通知内容
/// </summary>
@property (nonatomic,copy) NSString * NoticeContent;
/// <summary>
/// 用户微信昵称
/// </summary>
@property (nonatomic,copy) NSString * UserWxNickName;
/// <summary>
/// 用户头像
/// </summary>
@property (nonatomic,copy) NSString * UserHeadImgURL;
/// <summary>
/// 冻结收益
/// </summary>
@property (nonatomic,strong) NSNumber *
 LockIntegral;
/// <summary>
/// 已欠货款
/// </summary>
@property (nonatomic,strong) NSNumber * OweDeposit;


- (NSString *)getContentString;


@end
