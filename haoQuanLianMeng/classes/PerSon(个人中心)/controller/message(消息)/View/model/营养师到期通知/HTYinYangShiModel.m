//
//  HTYinYangShiModel.m
//  haoQuanLianMeng
//
//  Created by 罗海波 on 2018/7/13.
//  Copyright © 2018年 HT. All rights reserved.
//

#import "HTYinYangShiModel.h"

@implementation HTYinYangShiModel


- (NSString *)getContentString{
    
    NSString * t;
    if(self.NoticeScene == 2){
        t = @"您好,您的营养师资格即将到期，请注意查看";
    }else{
        t = @"您好,您的营养师资格已成功续费，请注意查看";
    }
    
    return [NSString stringWithFormat:@"%@\n会员昵称:%@\n到期时间:%@\n剩余时间:%@天",
            t,self.UserWxNickName,self.ExpireTime,self.SurplusDay];
}
@end
