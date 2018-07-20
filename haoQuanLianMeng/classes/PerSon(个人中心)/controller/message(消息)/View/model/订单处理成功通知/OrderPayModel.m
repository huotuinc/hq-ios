//
//  OrderPayModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "OrderPayModel.h"

@implementation OrderPayModel


- (NSString *)getContentString{

    return  [NSString stringWithFormat:@"您的好友购买了商品,您又有新收益了\n订单商品:%@\n订单编号:%@\n支付金额:%@\n支付时间:%@\n购买人昵称:%@\n获得返利:%@元",self.OrderName,self.OrderId,self.OrderAmount,self.PayTime,self.UserWxNickName,self.ProfitAmount];
}
@end
