//
//  TeamPListModel.h
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/5.
//  Copyright © 2018年 HT. All rights reserved.
//

#import <Foundation/Foundation.h>

//排序：0注册时间顺序 1注册时间倒序 2积分倒序 3积分顺序 4粉丝数倒序 5粉丝数顺序 6 最后登录时间倒序 7 最后登录时间顺序

typedef enum : NSUInteger {
    TeamSortByTimeStatus = 0,
    TeamSortByTimeFlashBackStatus = 1,
    TeamSortByScoreStatus = 2,
    TeamSortByScoreFlashBackStatus = 3,
    TeamSortByFansStatus = 4,
    TeamSortByFansFlashBackStatus = 5,
    TeamSortByLoginInStatus = 6,
    TeamSortByLoginInFlashBackStatus = 7,
    TeamSortByShaiXuanStatus = 8,
} TeamSortStatus;


@interface TeamPListModel : NSObject

@property (nonatomic,assign) int UserId;
@property (nonatomic,copy) NSString * NickName;
@property (nonatomic,copy) NSString * UserImage;
@property (nonatomic,copy) NSString * UserLevelName;
@property (nonatomic,assign) int FansAmount;
@property (nonatomic,assign) int OfferScore;
@property (nonatomic,copy) NSString * RegisterTime;
@property (nonatomic,copy) NSString * Recommender;
@property (nonatomic,copy) NSString * Memo;
@property (nonatomic,assign) int Relation;
@property (nonatomic,copy) NSString * LastLoginTime;
@property (nonatomic,assign) int UserType;
@property (nonatomic,assign) long ExpireTime;

@end
