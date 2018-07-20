//
//  HTMessageNoMoney.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageNoMoney.h"

@implementation HTMessageNoMoney


- (NSString *)getContentString{
    
    return [NSString stringWithFormat:@"您好,您的代理商货款不足,请注意查看\n会员昵称:%@\n冻结收益%@\n已欠货款:%@",self.UserWxNickName,self.LockIntegral,self.OweDeposit];
}
@end
