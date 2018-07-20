//
//  HTDaiLiOrderPayModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTDaiLiOrderPayModel.h"

@implementation HTDaiLiOrderPayModel



- (NSString *)getContentString{
    
    /// 通知时间
//    @property (nonatomic,copy) NSString  * NoticeTime;
//    /// 通知内容
//    @property (nonatomic,copy) NSString  * NoticeContent;
//    /// 订单名称
//    @property (nonatomic,copy) NSString  *OrderName;
//    /// 订单号
//    @property (nonatomic,copy) NSString  *OrderId;
//    /// 订单金额
//    @property (nonatomic,copy) NSString  *OrderAmount;
//    //支付时间
//    @property (nonatomic,copy) NSString  *PayTime;
//    // 用户微信昵称
//    @property (nonatomic,copy) NSString  *UserWxNickName;
//    // 用户微信昵称
//    @property (nonatomic,copy) NSString  *UserHeadImgURL;
//    //代理金额
//    @property (nonatomic,copy) NSString  *AgentPrice;
//
//    //剩余金额
//    @property (nonatomic,copy) NSString  *SurplusDeposit;
//    //代理订单支付成功通知
//    @property (nonatomic,assign) int NoticeType;
//    /// 通知场景
//    @property (nonatomic,assign) int NoticeScene;
    
    return  [NSString stringWithFormat:@"您的好友购买了商品,您又有新的代理收益了\n订单商品:%@\n订单编号:%@\n支付金额:%@\n支付时间:%@\n购买人昵称:%@\n代理价:%@元\n剩余货款:%@元",self.OrderName,self.OrderId,self.OrderAmount,self.PayTime,self.UserWxNickName,self.AgentPrice,
     self.SurplusDeposit];
}
@end
