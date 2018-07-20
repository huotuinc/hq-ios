//
//  HTMessageUpdate.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageUpdate.h"
#import "HTMessageCellModel.h"

@implementation HTMessageUpdate


- (NSString *)getContentString{
    
    NSString * tt;
    NSString * cc;
    if (self.NoticeScene == MessageInviteBecomeNutritionis) {
        tt = @"您好,恭喜你成功邀请了一位好友成为了营养师";
        cc = @"获取收益";
    }else if (self.NoticeScene == MessageInviteBecomeAgent){
        tt = @"您好,恭喜你成功邀请了一位好友升级为代理商";
        cc = @"获取货款";
    }else if(self.NoticeScene == MessgaeUserBecomeAgent){
        tt = @"您好,恭喜你成功成为代理商";
        cc = @"获取货款";
    }
    return  [NSString stringWithFormat:@"%@\n会员昵称:%@\n升级时间:%@\n%@:%@",tt,self.UserWxNickName,self.UpgradeTime,cc,self.ProfitAmount];
}
@end
