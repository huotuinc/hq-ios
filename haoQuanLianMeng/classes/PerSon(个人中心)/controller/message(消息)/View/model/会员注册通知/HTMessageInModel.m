//
//  HTMessageInModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTMessageInModel.h"

@implementation HTMessageInModel


- (NSString *)getContent{

   NSString * cc =   [NSString stringWithFormat:@"您好,您的团队有新的会员加入\n会员昵称:%@(%@)\n注册时间:%@\n推荐人:%@\n请继续努力哦！",self.UserLoginName,self.UserWxNickName,self.NoticeTime,self.BuddyWxNickName];
    return  cc;
}
@end
